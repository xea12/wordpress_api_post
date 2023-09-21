<?php
include 'wp-config.php';
include 'connect.php';
// dodawanie postów na wiele domen wordpress 


function SendPost($api_url, $headers, $post_data_json, $id, $conn) {
    $ch = curl_init();

// Konfiguracja opcji cURL
    curl_setopt($ch, CURLOPT_URL, $api_url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data_json);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Wykonanie żądania cURL i pobranie odpowiedzi
$response = curl_exec($ch);

// Sprawdzenie odpowiedzi
    $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    if ($http_status == 201) {
        $response_data = json_decode($response, true);
        $wpId = $response_data['id'];
        echo 'Post został dodany pomyślnie. ID posta: ' . $wpId . '<br>';
        $q = "UPDATE wp_posts SET sent = 'true', wp_id='$wpId' WHERE id = '$id'";

        if ($conn->query($q) === TRUE) {
            echo "Status został zaktualizowany pomyślnie.";
        } else {
            echo "Błąd podczas aktualizacji statusu: " . $conn->error;
        }

        // Zamknięcie połączenia z bazą danych


    } else {
        echo 'Wystąpił błąd podczas dodawania posta. Kod błędu: ' . $http_status;
        echo '<br>Treść odpowiedzi: ' . $response;
        exit;
    }

// Zamknięcie sesji cURL
    curl_close($ch);
}

if (!empty($data)) {
    foreach ($data as $key => $val) {

        $api_url = 'https://'.$val['name'].'/wp-json/wp/v2/posts';

        $headers = array(
            'Authorization: Bearer '. $val['bearer'],
            'Content-Type: application/json; charset=utf-8'
        );

        $post_data = array(
            "title" => $val['title'],
            "content" => $val['content'],
            "status" => "publish",
            "comment_status" => "closed"
        );

        $post_data_json = json_encode($post_data);

        SendPost($api_url, $headers, $post_data_json, $val['id'], $conn);


    }
} else {
    echo 'Brak postów do wgrania';
}

$conn->close();


?>
