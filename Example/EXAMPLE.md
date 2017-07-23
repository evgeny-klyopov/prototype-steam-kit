# Примеры
### 1. Получение и добавление/обновление пользователя
```php
// поиск и получение информации о пользователе
$user = (new \Example\Steam\Kit\User())->getCommunityData('76561197993222972');
// добавление/обновление пользователя
(new \Example\Models\User)->insertOnUpdate(
    $user
);
```
или
```php
// поиск и получение информации о пользователе
$user = (new \Example\Steam\Kit\User())->getCommunityData('dronoz');
// добавление/обновление пользователя
(new \Example\Models\User)->insertOnUpdate(
    $user
);
```
### 2. Получение и добавление/обновление инвентаря пользователя
```php
// получение инвентаря пользователя
$inventory = (new \Steam\Kit\User())->getInventoryBySteamId64('76561197993222972');
// обновление инвентаря пользователя
(new \Example\Models\UserInventory)->insertOrUpdateBySteamId64(
    $inventory
);
```
### 3. 
