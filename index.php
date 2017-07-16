<?php
$loader = @include __DIR__ . '/vendor/autoload.php';


$exampleSteamKitUser = new \Example\Steam\Kit\User();

$exampleModelSteamUser = new \Example\Models\User();
$exampleModelSteamInventory = new \Example\Models\Inventory();

echo 'Получение информации' . PHP_EOL;
echo 'Get Steam64 for user dronoz: ' . $exampleSteamKitUser->getSteamId64ByCommunityId('dronoz') . PHP_EOL;
echo 'Get Inventory for user dronoz: ' . $exampleSteamKitUser->getInventoryBySteamId64(
        $exampleSteamKitUser->getSteamId64ByCommunityId('dronoz')
    )
;

echo PHP_EOL . PHP_EOL;
echo 'Обновление информации' . PHP_EOL;
echo 'Insert steam user dronoz: ' . $exampleModelSteamUser->insertOnUpdateUserBySteamId64(
        $exampleSteamKitUser->getSteamId64ByCommunityId('dronoz'),
        'dronoz'
    ) . PHP_EOL
;
echo 'Update steam inventory for user dronoz: ' . $exampleModelSteamInventory->updateBySteamId64(
        $exampleSteamKitUser->getSteamId64ByCommunityId('dronoz'),
        $exampleSteamKitUser->getInventoryBySteamId64(
            $exampleSteamKitUser->getSteamId64ByCommunityId('dronoz')
        )
    ) . PHP_EOL
;





