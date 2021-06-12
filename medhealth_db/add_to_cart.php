<?php

require 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $id_user = $_POST['id_user'];
    $id_product = $_POST['id_product'];

    $cekCart = mysqli_query($connection, "SELECT * FROM cart WHERE id_user = '$id_user' AND id_product = '$id_product'") or die("Query error : " . mysqli_error($connection));
    $resultCekCart = mysqli_fetch_array ($cekCart);

    if($resultCekCart) {
        $response['value'] = 2;
        $response['message'] = "Sorry, product has been selected";
        echo json_encode($response);
    } else {
        $cekProduct = mysqli_query($connection, "SELECT * FROM product WHERE id_product = '$id_product'");
        $fetchProduct = mysqli_fetch_array($cekProduct);
        $fetchPrice = $fetchProduct['price'];

        $insertToCart = "INSERT INTO cart VALUE ('','$id_user','$id_product','1','$fetchPrice', NOW())";

        if (mysqli_query($connection, $insertToCart)){
            $response['value'] = 1;
            $response['message'] = "Yeay, product added to cart success";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Sorry, product failed to added";
            echo json_encode($response);
        }
    }
}