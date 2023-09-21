<?php
include 'connect.php';
// dodawanie postów z obrazkiem wyróżniającym na wiele domen wordpress 
function wyslijObrazekDoWordPressa($val, $sciezkaDoObrazka) {
    // Ścieżka do pliku z obrazkiem, który chcesz wysłać
    $plik = realpath($sciezkaDoObrazka);

    if (!$plik || !file_exists($plik)) {
        return "Błąd: Nie można odnaleźć pliku z obrazkiem";
    }

    // Adres URL API WordPressa
    $url = 'https://' . $val['name'] . '/wp-json/wp/v2/media';

    // Dane do przesłania
    $dane = array(
        'file' => new CURLFile($plik),
    );

    // Inicjacja cURL
    $ch = curl_init($url);

    // Konfiguracja opcji cURL
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $dane);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: multipart/form-data',
        'Authorization: Bearer ' . $val['bearer'], // Dodaj nagłówek autoryzacji "Bearer" z tokenem
    ));

    // Wykonaj zapytanie cURL
    $response = curl_exec($ch);

    // Sprawdź, czy wystąpiły błędy
    if (curl_errno($ch)) {
        return 'Błąd cURL: ' . curl_error($ch);
    }

    // Zamknij połączenie cURL
    curl_close($ch);

    // Zwróć odpowiedź z serwera WordPressa
    $response_data = json_decode($response, true);
    //return $response;
    return $response_data['id'];

}function SendPostWithFeaturedImage($api_url, $headers, $post_data_json, $image_id, $id, $conn) {
    $ch = curl_init();
    $id = $id['id'];

    // Jeśli nie ma obrazka, nie dodawaj ID obrazka wyróżniającego do danych posta
    if ($image_id !== 0) {
        $post_data = json_decode($post_data_json, true);
        $post_data['featured_media'] = $image_id;
        $post_data_json = json_encode($post_data);
    }

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
        echo '<br>Post został dodany pomyślnie. ID posta: ' . $wpId . ' - ';

        $q = "UPDATE wp_posts SET sent = 'true', wp_id='$wpId' WHERE id = '$id'";

        if ($conn->query($q) === TRUE) {
            echo "Status został zaktualizowany pomyślnie.";
        } else {
            echo "Błąd podczas aktualizacji statusu: " . $conn->error;
        }
    } else {

        echo 'Wystąpił błąd podczas dodawania posta. Kod błędu: ' . $http_status;
        echo '<br>Treść odpowiedzi: ' . $response;
        exit;
    }

    curl_close($ch);
}

if (!empty($data)) {
    foreach ($data as $key => $val) {
        $api_url_post = 'https://' . $val['name'] . '/wp-json/wp/v2/posts';
        $headers_post = array(
            'Authorization: Bearer ' . $val['bearer'],
            'Content-Type: application/json; charset=utf-8'
        );

        $post_data = array(
            "title" => $val['title'],
            "content" => $val['content'],
            "status" => "publish",
            "comment_status" => "closed"
        );

        $post_data_json = json_encode($post_data);

        if ($val['image'] === "" or $val['image'] === null) {
            $image_id = 0;
            SendPostWithFeaturedImage($api_url_post, $headers_post, $post_data_json, $image_id, $val, $conn);
        } else {
            $api_url_image = 'https://' . $val['name'] . '/wp-json/wp/v2/media';
            $image_path = __DIR__ . '/image/drukarka.jpg'; // Podmień na ścieżkę do obrazka
            //echo '------'.$image_path.'------';
            $headers_image = array(
                'Authorization: Bearer ' . $val['bearer'],
                'Content-Type: multipart/form-data'
            );

            $image_id = wyslijObrazekDoWordPressa($val, $image_path);
            //echo '------'.$image_id.'------';
            SendPostWithFeaturedImage($api_url_post, $headers_post, $post_data_json, $image_id, $val, $conn);
        }
    }
} else {
    echo 'Brak postów do wgrania';
}

$conn->close();
