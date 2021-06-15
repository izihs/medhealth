<?php

require "config.php";

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
    $response = array();
    $cartID = $_POST['cartID'];
    $tipe = $_POST['tipe'];

    $cek_cart = mysqli_query($connection, "SELECT * FROM cart WHERE id_cart = '$cartID'");
    $result = mysqli_fetch_array($cek_cart);

    $qty = $result['quantity'];

    if ($result) {
        # code...
        if ($tipe == "tambah") {
            # code...
            $update_tambah = mysqli_query($connection, "UPDATE cart set quantity = quantity + 1 WHERE id_cart = '$cartID'") or die("Query error : " . mysqli_error($connection));
            if ($update_tambah) {
                # code...
                $response['value'] = 1;
                $response['message'] = "";
                echo json_encode($response);
            } else {
                # code...
                $response['value'] = 0;
                $response['message'] = "Failed to add quantity";
                echo json_encode($response);
            }
        } else {
            # code...
            if ($qty == "1") {
                # code...
                $query_delete = mysqli_query($connection, "DELETE FROM cart WHERE id_cart = '$cartID'");
                if ($query_delete) {
                    # code...
                    $response['value'] = 2;
                    $response['message'] = "";
                    echo json_encode($response);
                } else {
                    # code...
                    $response['value'] = 0;
                    $response['message'] = "Failed to delete the quantity";
                    echo json_encode($response);
                }
            } else {
                # code...
                $update_kurang = mysqli_query($connection, "UPDATE cart set quantity = quantity - 1 WHERE id_cart = '$cartID'");
                if ($update_kurang) {
                    # code...
                    $response['value'] = 3;
                    $response['message'] = "";
                    echo json_encode($response);
                } else {
                    # code...
                    $response['value'] = 0;
                    $response['message'] = "Failed to reduce the quantity";
                    echo json_encode($response);
                }
            }
        }
    } else {
        # code...
        $response['value'] = 0;
        $response['message'] = "empty";
        echo json_encode($response);
    }
}
