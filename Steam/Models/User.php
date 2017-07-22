<?php

namespace Steam\Models;


/**
 * Interface SteamUser
 * Интерфейс для работы с таблицой steam_user
 * @package Models
 */
interface User
{
    /**
     * Добавление или обновляем пользователя
     * - делаем insert on duplicate key (благодаря ключу steamId64, в таблице steam_user),
     * обновляем CommunityId и dateUpdate (через переменную @dateUpdate = date('Y-m-d H:i:s');
     * @param array $user   - Информация о пользователе (new \Steam\Kit\User())->getCommunityData('dronoz');
     * @return bool         - Флаг обновления, true - успешное обновление
     */
    public function insertOnUpdate(array $user): bool;
}