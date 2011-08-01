<?php


include_once('LIB_library/LIB_http.php');
include_once('phpQuery.php');
include_once(dirname(__FILE__) . '/_constants.php');
include_once(dirname(__FILE__) . '/_functions.php');
include_once(dirname(__FILE__) . '/_db.php');

$charset = 'utf-8';

$categories_page = http_get($target = SITE_CATEGORIES_URL, $referer = '');

$phpQuery_page = phpQuery::newDocumentHTML($categories_page['FILE'], $charset);

$categories = pq('#tabbed_1_content ul li a[id!="cat_az"]');
//var_dump(pq('#tabbed_1_content ul li'));

$secondary_ids = array(1052650, 1053202, 1053300, 1053284, 1053285, 
                            1053311, 1053324, 1053368, 1053390, 1053400, 
                            1053351, 1053410, 1053423, 1053448, 1053496, 1056236);
$count = 0;

foreach ($categories as $category)
{
    $db->insert() pq($category)->text();
    
    $rubrikenJson = http_get("http://www.gelbeseiten.de/yp/rubriken.yp?themaID={$secondary_ids[$count++]}&locationHit=", $referer = '');
    
    $secondary_categories = json_decode($rubrikenJson['FILE']);
    
    foreach ($secondary_categories as $secondary_category)
    {
        $branchenJson = http_get("http://www.gelbeseiten.de/yp/branchen.yp?rubrikId={$secondary_category[1]}&locationHit=", $referer = '');
        
        $third_categories = json_decode($branchenJson['FILE']);
        
        foreach ($third_categories as $third_category)
        {
            echo pq($category)->text() . ' ' . $secondary_category[0] . ' ' . $third_category[0] . PHP_EOL;
        }
    }
}

//if (!$page = getHtml($link = SITE_URL)) 
//{
//    _die('CATEGORY PAGE NOT EXISTS. Exiting.' . PHP_EOL . $link . PHP_EOL);
//}

//$sessionDataString = phpQuery::newDocumentHTML('page');
//var_dump(pq('#startpageForm p input')->attr('value'));


//$data = file_get_contents('http://www.gelbeseiten.de/yp/search.yp?sessionDataString=H4sIAAAAAAAAAFWLywrCMBBFv8ZlYDJJOimzU%2FCxEEXBbUnbqRZKlSQI%2Fr1BEHF5zj1Xa9sHi4KqJkPKkgmqDT4oHAiMbonaHpTvwWnyjGjYLHAt8SrtPKZpTFkKb87Nn-pL69WBSmm0ZUw4xJxm%2F5Y%2FZ5xh6SRJid-pNc-pqWlytgFrXgLvEv3mJsokzzD3AnvNQKArg0hAh8-pKR-pBT-pV4sZ6HmipXOe0cvwGm9DY51wAAAA-e-e&at=yp&kindOfSearch=tradelistindex&subject=&location=&distance=-1&execute=Suchen&suggest_choose=on&trade=834');
//var_dump($data);

//phpQuery::ajaxAllowHost('rubriken.yp');
//$json = phpQuery::getJSON('rubriken.yp');

//$json = file_get_contents('http://www.gelbeseiten.de/yp/rubriken.yp?themaID=1052650&locationHit=');
//var_dump(json_decode($json));


//$json_data = Zend_Json::decode($json, Zend_Json::TYPE_OBJECT);

//var_dump($json_data);

?>
