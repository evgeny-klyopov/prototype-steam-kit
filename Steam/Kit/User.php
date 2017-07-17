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

    /**
     * Получение списка значков пользователя http://prntscr.com/frpw1e
     * (интересны только завершенные значки - значки с уровнем от 1 до ...)
     * https://developer.valvesoftware.com/wiki/Steam_Web_API/Feedback#Provide_an_API_for_badges
     * https://wiki.teamfortress.com/wiki/WebAPI/GetBadges
     * @param int $steamId64    - Идентификатор steamId64
     * @return array $badges    - Массив значков, ключи которого идентификаторы игр,
     * значение - уровень значка
     * $badges = [
     *      @gameCardId => @level
     *      ...
     * ];
     */
    public function getBadges(int $steamId64): array;

    /**
     * Получение уровня значка пользователя http://prntscr.com/frpvq0
     * https://wiki.teamfortress.com/wiki/WebAPI/GetCommunityBadgeProgress
     * @param int $steamId64    - Идентификатор steamId64
     * @param int $gameCardId   - Идентификатор игры
     * @param bool $isMetal     - Флаг металического значка
     * @return int              - Возвращает уровень значка
     */
    public function getLevelBadge(int $steamId64, int $gameCardId, bool $isMetal): int;
}
