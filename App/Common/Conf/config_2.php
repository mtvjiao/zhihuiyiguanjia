<?php
return array(
	'URL' =>'http://127.0.0.1/qwadmin/', //��վ��URL
	//���ݿ���������
	'DB_TYPE'   => 'mysql', // ���ݿ�����
	'DB_HOST'   => 'localhost', // ��������ַ
	'DB_NAME'   => 'houtai829', // ���ݿ���
	'DB_USER'   => 'root', // �û���
	'DB_PWD'    => 'root', // ����
	'DB_PORT'   => 3306, // �˿�
	'DB_PREFIX' => 'qw_', // ���ݿ��ǰ׺
	'DB_CHARSET'=>  'utf8',      // ���ݿ����Ĭ�ϲ���utf8
	//��������
	'DB_PATH_NAME'=> 'db',        //����Ŀ¼����,��Ҫ��Ϊ�˴�������Ŀ¼
	'DB_PATH'     => './db/',     //���ݿⱸ��·�������� / ��β��
	'DB_PART'     => '20971520',  //��ֵ��������ѹ����ķ־���󳤶ȡ���λ��B����������20M
	'DB_COMPRESS' => '1',         //ѹ�������ļ���ҪPHP����֧��gzopen,gzwrite����        0:��ѹ�� 1:����ѹ��
	'DB_LEVEL'    => '9',         //ѹ������   1:��ͨ   4:һ��   9:���
	'LOAD_EXT_CONFIG' => 'const', 

);
?>