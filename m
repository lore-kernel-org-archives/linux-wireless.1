Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794986574;
	b=RKdRcwhS1PVepYrmiVNpNENvoxpc0ryP8ngzHge9ikGWyZ3MBnbj+OjI76nzvbtS5hbx
	 6ZfirjNlO8VdGVFRH/krbPbRrwR3iZF3JpGjwcm1G58j5BfNytdT9lHr544+KZvW0CqK3
	 J78jqv9PAlHAT6I3HKdh2ahXyZJ9SsMvNwKj2sUjcXOZuBW6cvkrIXJ01irUYa9cwBNH7
	 zV0+t97NwRPn0FL+Q1Frl9lcLYlt9+qdyayyzfa7jFxVoXerPc0Ulskwo1j3GoKAkXL5k
	 yTX70Dvfc35q04XC90PZPb3GEP5sdZe1u7+GEDZMu6bXOcPkI45k8sdedHUuBCJIkWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986574;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9I6S/uKaDGdlKHVkUjP9W2meMhvm9hWENrvpaN1wVYI=;
	b=MgPqwOQyW7Xn2lOIkOAFTRnEnr9u08d2yxZBIxnElizvcHKLGzeKgeWQF9pBwWhG/H1j
	 jRtOukoHhntAqF9QQssj18es0tIB7+SM5LGm16L8lJ6THVPaa8qQfHvUdLS5DhYUPQCHH
	 SZjcNNBeYGVrOjwx87kzmtPZ0mG2pykLs6XiBCyVSupMaXujG5qNCvN4zpxbqxVNnLPO3
	 CeFo6FmQsSMR4GKxVBQTmZTVZk93pp2MLWJXbqy7OsVdG4m1tIRWGzlSL+XeHrX5rzO7K
	 Es1os2x1B7ZBid2R0rNFiJoBQl4cKNry0UBwxNmGbN1GbbJKwqBF2bzNYeHMIvq/iDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FQlj8wG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.23.20
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010020.outbound.protection.outlook.com [52.103.23.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B607606A31C;
	Wed, 18 Nov 2026 07:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B607606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FQlj8wG2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mB7igPBT8FIyLDlSLasyjaMf+I+V2K0+F89uzqeTVrD6is0+LK7mNV4AmG0oR6OtZMotfE5ABM9nQ4J1iiy+SyrcHQVQ7lThnHMxR8GCvSOuao6MF/swps1iIwSf21N5xdGkGCT98Ro3ZElIXmLjcyrlISdmpP1mHBKPRLy7PS14CWqKbdWs2DaXqIEZEpMPhGJTNQvrb0FpyZ/WwffXBRl4Oc3o4KRSjThlShemv624r43q3dTgwDb1Cy08peMWvXZMlQTKX+g73EeHPSc7tsBXAEon/lwkhp8Xa8cI2XJau+t292QC27HKvvTGA+L+8vNxttaUA3Jk0/vEaA1h7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I6S/uKaDGdlKHVkUjP9W2meMhvm9hWENrvpaN1wVYI=;
 b=Gy7iD9X3MrdvCdvXMCf8uZETXx80CWq4XjAyCSSz3SgPVr52bIy+aoT3iDMGfYuyWOqV/CBoGdzFl6iw1t/z7zCkFpfUsUNUOnbVltG19QesEjDmwCUXAfcZswd+p1pLnpwRobdVd5RUoTmPtKVT6e7oOOmMfXAuATxAMT6AeJ813TNojEgBfd6O6b7cKl33lHrFwOW+rMSeRz78Ff1kCqY75a5lTK7fFgEHUGntLDkU3umOu0oDrjuCWLNnYbz18+JGdu3OQZO5Ae8hV9WveoG5sgVhNcCkM9x3JmQKDZXnxwT9FcN6Ss90FOQH9KrILGc1cRbfago+ofPbpA3q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I6S/uKaDGdlKHVkUjP9W2meMhvm9hWENrvpaN1wVYI=;
 b=FQlj8wG2Fc73b5qOXuqQbGm1TYuI/ErJ9rd8Jx0knGncwwXjqx8u4ju/g+adqp+A7ekmTtwL3l7BP0u6vP82NC3pl8BYp8h2elNRTba/FxF/u7ryOVFjgoJHw44mh8pp8EzOmhQXJnfbINUmdvYTN/JkKT4JoRMkRmp60IMOc/tC+6fRbTEMWkvT+6XleifzOMigeZreXD74XHDrLgf114V+Bub+8la/KzwVgrBvJkwvMXDeWtVSrbqLjLstT8iXCGMwYcKS+RvP2xM4PHpBxDjsyCzdBqEQSQs6fWlFpUlcnzK0jK+GbZEDl7BY7UOIs00NDsNDWzGavoFRmU9RxA==
Received: from SA1PR19MB5152.namprd19.prod.outlook.com (2603:10b6:806:1a0::8)
 by IA3PR19MB176067.namprd19.prod.outlook.com (2603:10b6:208:714::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:20:16 +0000
Received: from SA1PR19MB5152.namprd19.prod.outlook.com
 ([fe80::308b:c343:ebf0:a11e]) by SA1PR19MB5152.namprd19.prod.outlook.com
 ([fe80::308b:c343:ebf0:a11e%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:20:16 +0000
From: Alone io <aloneoiii@outlook.com>
To: Brian Norris <briannorris@chromium.org>
CC: Francesco Dolcini <francesco@dolcini.it>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH wireless-next] wifi: mwifiex: replace strcpy() in firmware
 dump assembly
Thread-Topic: [PATCH wireless-next] wifi: mwifiex: replace strcpy() in
 firmware dump assembly
Thread-Index: AQHddywacwuOO3xgQ0q7DSpLe5pJ+g==
Date: Wed, 18 Nov 2026 07:20:16 +0000
Message-ID:
 <SA1PR19MB5152FD4E7CB85E0B19C1788DA07A2@SA1PR19MB5152.namprd19.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR19MB5152:EE_|IA3PR19MB176067:EE_
x-ms-office365-filtering-correlation-id: 084a6a34-fd2d-49bb-76f1-08df45446520
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|25010399006|19110799012|8062599012|37102599003|8060799015|4140399003|15030799006|55001999006|31061999003|24071999003|15080799012|30051999003|45011099003|20031999006|40105399003|102099032|440099028|3412199025|19061999003;
x-microsoft-antispam-message-info:
 =?gb2312?B?dXRNVWJlODZ5aVNEeHJtaDZ2aXpZaFJlMnJTOGtNckhtWWtTNm9PUWljRDd6?=
 =?gb2312?B?SXQ5ck5uckJRTFVhL2VwVEMwQitLeG5RQ1BuL1hLYXF0WVFCQ3gyRytuZUpY?=
 =?gb2312?B?bWtqbmk4RzhoTjZSalBONkhGMll2aE4zSXoxeEZBdExuU0dwai9YeHJVajB0?=
 =?gb2312?B?Q3FJalBHaUk4b1NqY0lBaUJheXViNlhrMzZ6Z1M4UkdmSS9SL2FZZzNETVI3?=
 =?gb2312?B?Z2k1aDRsUWVYYkZOZXFQSk43UVhXSklxbkdxSFo1TFF3YlFDQjZpOG50ZTlE?=
 =?gb2312?B?ejNqQ1dlZWhOM3ExV2srRHBhczE0ZGYzdTNMV29KWXc3TlFEdEh5UnlVcTlM?=
 =?gb2312?B?WVdRV0M0eTc5bE55OE8vdDdxVURJTmtseWRVanpTOE5wQXZCV0cxdndFbjhD?=
 =?gb2312?B?Vllsa05FT1c2eEh1eUxZMFVWYTFnZWI4YXpITEhpdGh5cWljQW1aWDdJaVMz?=
 =?gb2312?B?YWo2SG4xSExTT3pMYzRYa0xkVXAveHVHZlhEcXBVZ3g0czhNMzR2SlhSNkVO?=
 =?gb2312?B?a05LZDBlMjBLbGxOVlc0V2E1Qy9BTWFnOVAyQzdReG9KYlo2VzlrQmx5QU9L?=
 =?gb2312?B?RkJ0YnJXZ3RoQ3Uvb05xVzN6YU5mazMweGR6T000cDZQSHdZVXpWL2w4ZThH?=
 =?gb2312?B?K29qQ0cvWkMrNi92MnBEM0pBUkJ3LzRETjRJRjM3UGk3aFV4M01rMERTb29Y?=
 =?gb2312?B?MElGanZzY0dIQlNXT3V5QktyNFFCeTgvbXVwMzUwbEN1UGMxeS9SUDVtU2xt?=
 =?gb2312?B?M2hKMXlsN2FMQUpuYXFIQmlwQmE2Q2NiL2R1alZkZVlKZDhob2tSOE1BajV0?=
 =?gb2312?B?TWZ3aFF3SlhlckhQR3JMa2t4MlFZaDNQWWV3ZVBkK0NxWVB2aHFHZDMreVdE?=
 =?gb2312?B?bVVCMUNVWXlhaS9iZGg1c1FCb3hvSXVHUzE0dDdiRFphY21XZk4vMy9pQWJy?=
 =?gb2312?B?dXlXMzV4NEVpcHdYd2pQOXBwSlZ4N0RrWi9LRWhsYWVWSkhpRHF6NGJITFhu?=
 =?gb2312?B?N090TzlHdWJGN3NVYjZreEtuVnd5K2VuWjdvT1lwOGh4dFlhdG9adVZrTG01?=
 =?gb2312?B?ZEczUUVWenhUUzNxOHlWcnRhSTJGekcwM1lNcEdCay9mOWZKK2t6L2NxTzVo?=
 =?gb2312?B?MnZNSVZOdmJveWE2SjlPYUVmeEw5a1lTODBwemp3c3BIaTV4Y1NnQjlTTjhC?=
 =?gb2312?B?VFNPVllValdPb3ZZNW8rYUFDTnl0cjI2cVpkbUswdWFVN1JiMktEdEd1bUto?=
 =?gb2312?B?TytaeDlVYVFTTkFuWUdGV1cxZE5EMFZLNUtJYklOZytkSTlmbXdvVVE0SnZF?=
 =?gb2312?B?d0tqOVZNSU1HVGRyVjdza1hxUWcybFFBMDhDRHFBN21kU3YxZlpJQVBiZWU2?=
 =?gb2312?B?S3hnM09RQUZBVXpXNHhXWWhnMWVGUGlMczk3Q3F2c2haT1Z4YVRJaEh6UnBC?=
 =?gb2312?B?Vnc4bjB3aXB4aXphNXdUUGU5c2dPNkU4ZnF0d2hlUVNMUVBkQ1Vma1hGV3Vl?=
 =?gb2312?B?NzI2SUttSDJkWkE5cjFaOURlWXBMWVBNSHhFYWtVNkVjRjlYRGt4WGo5Z1hn?=
 =?gb2312?Q?CxSbhcgEx0gQJ+KjY1t0mUTik=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UWdrUHNWRHREdWE2OTBwKzdXUSt1QTArTUhSS3RTQ1IvTHhBYnI1eFd2N2FM?=
 =?gb2312?B?cmU0aHZFcW9GZ2szaTEwK1RKUnRsMmlhTXpJbHJuVU1xM2hTRnlZTDBRMUsw?=
 =?gb2312?B?TDNkZ280NVk3eEs4OFk0b2VIeHI5V3FPMU9VcjVTMnJPTGZpOFVtMGR0c3dh?=
 =?gb2312?B?Ullmdjh4MUxCYm5qNlBNbzBWeEowMjc4d01Pb0p4anIwMzAvNUQ4SDBROVlr?=
 =?gb2312?B?bHRNalBsdkJTay9GS1NDTjlydzRMSnlORUQ5eE5IL3JDc2E4MHA5K21LMnhT?=
 =?gb2312?B?UlJSdktNN3RLRnRJWnlic3drcThacndQVElLaUpSeE1XdXZmQkZmbTJDa2JN?=
 =?gb2312?B?aVVVT1dKaEZTcGFVZi9sREtqanNsTWhLM3pPUUdFMmtQYkJxaGZvT3BZSTBh?=
 =?gb2312?B?RFVmVTFpNHdjcmdadVhJcWlZamZRRHdDTDgzS2FKWnhjWFZuWkgwYUNSTVNw?=
 =?gb2312?B?WXJIREM5Z0N4T2Vsb2p4TGprYzNGcm1GZlJZVitZZkFEclFkNzZhOFkyUHZj?=
 =?gb2312?B?VWVVTEdJMmtJeWRHNCtOQlZmRmRCSnZRczNiMkNiYTBlVWxpNW1DNjl1OE1N?=
 =?gb2312?B?aEpicGY4aiswb3kwN200disvZFBMZ1BRVFVmZGJJOEZGYUZsbExBTGdGTGh6?=
 =?gb2312?B?SGxkSjQxaitHbVdVY3F4amd6L1lBTzZuWldiblU4TFVlU1hsQ2x0S3YvUWRr?=
 =?gb2312?B?WE5adGhSRUx3SzJrUzBGaE1GOE1DUDg2VzFuVy8wR0VtZkhGUU5yNExQRmF3?=
 =?gb2312?B?RFV4c3EvOVRIajcyaHhDSlplaXQyajN3cC9ML0ZkU0JmN2Z4K2JOcGh0MHZN?=
 =?gb2312?B?eTFJOWpKK3I3R0tlMjZ1c0MxZFR0MFM4ejNKaXpJZW5sR25GZnNqZWFTK0xk?=
 =?gb2312?B?YXhVejZtaGZJcFVVTTRPTWhhU3k5WmxZV0N2SmJqOTQwQ0hxL240RTdMMm1W?=
 =?gb2312?B?V3cvM2FuMUJoNm4xR1ZwRk0wN0JKZko0VGxrU25oRFQ3REJtZHJVNS8waThp?=
 =?gb2312?B?bVRoSit4dWJ5NnVDc2JRMVBFVE5zMVN1c2h1ZmlnRVVDU2NIMGV1RVBWMkFG?=
 =?gb2312?B?VDdnWElWVmNKZmFFRUZkN2RIOTVqS1B3T0xPcVo5S0QvUGZhdEo1T1EwUlNW?=
 =?gb2312?B?bk15TXBZVGlRSXhNVGlOaEIxdjVTUi92L2dxL1FMZXAzWVhlanRubTF6WG1k?=
 =?gb2312?B?STlhQUtQeVdpSzl3WHk2REgrRzR0SkI5dkp4ekNXTG1WdDdTY3NPdmFZeWpZ?=
 =?gb2312?B?MmVha1BFM0pyNS9LK2NLYUZTZmFheisrcjk1QStFdzBadnFoZlZGL1JaSk5u?=
 =?gb2312?B?b05rdDkzNERZM2hSZzV3eE5qOFlWTWdTeTBFNFNpcW85dDl4c01rQy9ZMzJQ?=
 =?gb2312?B?ekRYUWdRaC9LdDFZaGVpQ09PY1Z0c0FjTmdQczdSYWJhYmhLbGRNUml6RSts?=
 =?gb2312?B?Umk0S0NpMXJYNlF4aDkyMjJQaDFEVG1USmtUM2pEZHFlOFd2OVovNlZTQnZs?=
 =?gb2312?B?Zmx1MFkwOTFSSmg3dW1wQ21xWUVNS09LRkx5OVJsZ0h2UG51SFMxNHZUek8v?=
 =?gb2312?B?TTQ1MExFaE9HTlJhUkZ3THlRYlN0cStTd0tkMUxrK0FJcnRoTnBFQ21Md2t4?=
 =?gb2312?B?dkl6dm9CM213NnYwRlgvZmpGOEl3UmFqU1lRaWZCMmdjME5lK3J3N0NEcGlD?=
 =?gb2312?B?RHY5eTlrcmlaOHJ5SXVLaHgvanVDTWI2RFpoeU1na2dVVU9FVnppc1NuS09j?=
 =?gb2312?B?NDk5UXRuRDJPRXhrTThtTm9FN0s1NnI2K0MxM29sNlhwQnpqUjRSalVpUkpm?=
 =?gb2312?Q?KeDi2MDzYA+0hIcX14Ez+lV3jupnl4FmM7H/k=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB5152.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 084a6a34-fd2d-49bb-76f1-08df45446520
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 07:20:16.5529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB176067

RnJvbTogWGluaGFuIFN1IDxnaXRAYWxvbmVpby5hbGVlYXMuY29tPgoKUmVwbGFjZSBzdHJjcHko
KSB3aXRoIGV4cGxpY2l0LWxlbmd0aCBjb3BpZXMgd2hlbiBhcHBlbmRpbmcgc2VjdGlvbgptYXJr
ZXJzIGFuZCByZWdpb24gbmFtZXMgdG8gdGhlIGZpcm13YXJlIGR1bXAuIFVzZSB0aGUgc2FtZSBt
YXJrZXIKYXJyYXlzIHRvIHNpemUgdGhlIGJ1ZmZlciBhbmQgd3JpdGUgdGhlIG1hcmtlcnMuCgpL
ZWVwIHRoZSBkdW1wIGJ5dGUtZm9yLWJ5dGUgaWRlbnRpY2FsLCBpbmNsdWRpbmcgdGhlIHRyYWls
aW5nIE5VTCwKd2hpY2ggaXMgZXhjbHVkZWQgZnJvbSBkZXZkdW1wX2xlbi4KClNpZ25lZC1vZmYt
Ynk6IFhpbmhhbiBTdSA8Z2l0QGFsb25laW8uYWxlZWFzLmNvbT4KLS0tCkJ1aWxkLXRlc3RlZCBv
biB4ODYtMzIgd2l0aCBHQ0MgMTQuMi4wIGFnYWluc3QgbWFpbmxpbmUgY29tbWl0CjIwZWVmMjli
N2M4NDY1YWM5OGQ3ZGQ2ZDZmMmFjMDdhOGQ4MDU2Y2EgdXNpbmcgbWFrZSB2bWxpbnV4IG1vZHVs
ZXMuClRoZSBtd2lmaWV4IGNvcmUgYW5kIFBDSWUsIFNESU8gYW5kIFVTQiBtb2R1bGVzIGJ1aWx0
IHN1Y2Nlc3NmdWxseQp3aXRob3V0IGNvbXBpbGVyIG9yIGxpbmtlciB3YXJuaW5ncy4gSGFyZHdh
cmUgdGVzdGluZyBpcyBwZW5kaW5nLgoKIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21hcnZlbGwvbXdp
ZmlleC9tYWluLmMgfCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9tYXJ2ZWxsL213aWZpZXgvbWFpbi5jIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWFydmVsbC9td2lmaWV4L21haW4uYwppbmRleCBjOGRmM2VkLi5hMGJlZWJjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tYXJ2ZWxsL213aWZpZXgvbWFpbi5jCisrKyBi
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL21hcnZlbGwvbXdpZmlleC9tYWluLmMKQEAgLTEyMDIsNiAr
MTIwMiw5IEBAIEVYUE9SVF9TWU1CT0xfR1BMKG13aWZpZXhfZHJ2X2luZm9fZHVtcCk7CiAKIHZv
aWQgbXdpZmlleF9wcmVwYXJlX2Z3X2R1bXBfaW5mbyhzdHJ1Y3QgbXdpZmlleF9hZGFwdGVyICph
ZGFwdGVyKQogeworCXN0YXRpYyBjb25zdCBjaGFyIGR1bXBfc3RhcnRbXSA9ICI9PT09PT09PVN0
YXJ0IGR1bXAgIjsKKwlzdGF0aWMgY29uc3QgY2hhciBkdW1wX3NlcGFyYXRvcltdID0gIj09PT09
PT09XG4iOworCXN0YXRpYyBjb25zdCBjaGFyIGR1bXBfZW5kW10gPSAiXG49PT09PT09PUVuZCBk
dW1wPT09PT09PT1cbiI7CiAJdTggaWR4OwogCWNoYXIgKmZ3X2R1bXBfcHRyOwogCXUzMiBkdW1w
X2xlbiA9IDA7CkBAIC0xMjExLDExICsxMjE0LDExIEBAIHZvaWQgbXdpZmlleF9wcmVwYXJlX2Z3
X2R1bXBfaW5mbyhzdHJ1Y3QgbXdpZmlleF9hZGFwdGVyICphZGFwdGVyKQogCQkJCSZhZGFwdGVy
LT5tZW1fdHlwZV9tYXBwaW5nX3RibFtpZHhdOwogCiAJCWlmIChlbnRyeS0+bWVtX3B0cikgewot
CQkJZHVtcF9sZW4gKz0gKHN0cmxlbigiPT09PT09PT1TdGFydCBkdW1wICIpICsKKwkJCWR1bXBf
bGVuICs9ICgoc2l6ZW9mKGR1bXBfc3RhcnQpIC0gMSkgKwogCQkJCQlzdHJsZW4oZW50cnktPm1l
bV9uYW1lKSArCi0JCQkJCXN0cmxlbigiPT09PT09PT1cbiIpICsKKwkJCQkJKHNpemVvZihkdW1w
X3NlcGFyYXRvcikgLSAxKSArCiAJCQkJCShlbnRyeS0+bWVtX3NpemUgKyAxKSArCi0JCQkJCXN0
cmxlbigiXG49PT09PT09PUVuZCBkdW1wPT09PT09PT1cbiIpKTsKKwkJCQkJKHNpemVvZihkdW1w
X2VuZCkgLSAxKSk7CiAJCX0KIAl9CiAKQEAgLTEyNDMsMjAgKzEyNDYsMjIgQEAgdm9pZCBtd2lm
aWV4X3ByZXBhcmVfZndfZHVtcF9pbmZvKHN0cnVjdCBtd2lmaWV4X2FkYXB0ZXIgKmFkYXB0ZXIp
CiAJCQkJCSZhZGFwdGVyLT5tZW1fdHlwZV9tYXBwaW5nX3RibFtpZHhdOwogCiAJCWlmIChlbnRy
eS0+bWVtX3B0cikgewotCQkJc3RyY3B5KGZ3X2R1bXBfcHRyLCAiPT09PT09PT1TdGFydCBkdW1w
ICIpOwotCQkJZndfZHVtcF9wdHIgKz0gc3RybGVuKCI9PT09PT09PVN0YXJ0IGR1bXAgIik7CisJ
CQlzaXplX3QgbmFtZV9sZW4gPSBzdHJsZW4oZW50cnktPm1lbV9uYW1lKTsKIAotCQkJc3RyY3B5
KGZ3X2R1bXBfcHRyLCBlbnRyeS0+bWVtX25hbWUpOwotCQkJZndfZHVtcF9wdHIgKz0gc3RybGVu
KGVudHJ5LT5tZW1fbmFtZSk7CisJCQltZW1jcHkoZndfZHVtcF9wdHIsIGR1bXBfc3RhcnQsIHNp
emVvZihkdW1wX3N0YXJ0KSk7CisJCQlmd19kdW1wX3B0ciArPSBzaXplb2YoZHVtcF9zdGFydCkg
LSAxOwogCi0JCQlzdHJjcHkoZndfZHVtcF9wdHIsICI9PT09PT09PVxuIik7Ci0JCQlmd19kdW1w
X3B0ciArPSBzdHJsZW4oIj09PT09PT09XG4iKTsKKwkJCW1lbWNweShmd19kdW1wX3B0ciwgZW50
cnktPm1lbV9uYW1lLCBuYW1lX2xlbiArIDEpOworCQkJZndfZHVtcF9wdHIgKz0gbmFtZV9sZW47
CisKKwkJCW1lbWNweShmd19kdW1wX3B0ciwgZHVtcF9zZXBhcmF0b3IsIHNpemVvZihkdW1wX3Nl
cGFyYXRvcikpOworCQkJZndfZHVtcF9wdHIgKz0gc2l6ZW9mKGR1bXBfc2VwYXJhdG9yKSAtIDE7
CiAKIAkJCW1lbWNweShmd19kdW1wX3B0ciwgZW50cnktPm1lbV9wdHIsIGVudHJ5LT5tZW1fc2l6
ZSk7CiAJCQlmd19kdW1wX3B0ciArPSBlbnRyeS0+bWVtX3NpemU7CiAKLQkJCXN0cmNweShmd19k
dW1wX3B0ciwgIlxuPT09PT09PT1FbmQgZHVtcD09PT09PT09XG4iKTsKLQkJCWZ3X2R1bXBfcHRy
ICs9IHN0cmxlbigiXG49PT09PT09PUVuZCBkdW1wPT09PT09PT1cbiIpOworCQkJbWVtY3B5KGZ3
X2R1bXBfcHRyLCBkdW1wX2VuZCwgc2l6ZW9mKGR1bXBfZW5kKSk7CisJCQlmd19kdW1wX3B0ciAr
PSBzaXplb2YoZHVtcF9lbmQpIC0gMTsKIAkJfQogCX0KIAo=
