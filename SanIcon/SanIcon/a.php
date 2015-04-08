<?php
$str = file_get_contents('./styles.css');

preg_match_all('/.icon-(.*):.*"\\\\(.*)"/uUm', $str, $result);

for ($i = 0; $i<count($result[1]); $i++) {
    $key = '@"'. str_replace(' ', '', ucwords(str_replace('-', ' ', $result[1][$i]))) .'"';
    //$value = '\\u'. strtoupper($result[2][$i]) . '';
    $value = '@"\\u'. strtoupper($result[2][$i]) . '"';
    $enum = 'SI'. str_replace(' ', '', ucwords(str_replace('-', ' ', $result[1][$i])));
    error_log($key.",\n", 3, 'key.txt');
    //error_log('@"'. unicode2utf8($value)."\",\n", 3, 'v.txt');
    error_log($value.",\n", 3, 'v.txt');
    error_log($enum.",\n", 3, 'e.txt');
}

function unicode2utf8($str){
        if(!$str) return $str;
        $decode = json_decode($str);
        if($decode) return $decode;
        $str = '["' . $str . '"]';
        $decode = json_decode($str);
        if(count($decode) == 1){
                return $decode[0];
        }
        return $str;
}
