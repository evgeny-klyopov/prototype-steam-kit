# Примеры
### 1. Добавление/обновление пользователя
```php
$user = (new \Example\Steam\Kit\User())->getCommunityData('76561197993222972');
(new \Example\Models\User)->insertOnUpdate(
    $user
);
```
или
```php
$user = (new \Example\Steam\Kit\User())->getCommunityData('dronoz');
(new \Example\Models\User)->insertOnUpdate(
    $user
);
```
### 2. Добавление/обновление пользователя
