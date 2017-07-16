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
     * Добавление пользователя $steamId64 или обновление $steamCommunityId у данного пользователя
     * @param int $steamId64            - Идентификатор steamId64
     * @param string $steamCommunityId  - Идентификатор пользователя в сообществе стиме
     * @return bool                     - Флаг обновления, true - успешное обновление
     */
    public function insertOnUpdateUserBySteamId64(int $steamId64, string $steamCommunityId): bool;
}