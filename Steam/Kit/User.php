<?php
namespace Steam\Kit;


/**
 * Interface User
 * Интерфейс для работы с пользователем стим
 * @package Steam\Kit
 */
interface User
{
    /**
     * Получение SteamId64 пользователя по communityId
     * @param string $communityId - Идентификатор пользователя в сообществе стиме http://prntscr.com/fwbhw3
     * @return int                - Возвращает идентификатор steamId64 http://prntscr.com/fwbi2t
     */
    public function getSteamId64ByCommunityId(string $communityId): int;

    /**
     * Получение вещей в инвентаре конкретного пользователя https://wiki.teamfortress.com/wiki/WebAPI/GetPlayerItems
     * @param int $steamId64    - Идентификатор steamId64
     * @return array $inventory - Массив ключи которого идентификаторы вещей в стиме,
     * значение - количество данных вещей
     * $inventory = [
     *      @steamItemId => @quantity
     *      ...
     * ];
     */
    public function getInventoryBySteamId64(int $steamId64): array;
}