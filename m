Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795569416;
	b=HHOprZlZJVugxAR2x7/eytNgj3naMgCLurehNmHKsOz9MrO3VOhrlFyDCVzLFVMdHiDe
	 YJmFp8XDjK2l87vXBAzx2R8WyGdOetgLA8ZRSpBEArLoQkjKDs8HTpMQjDX06gFbgnaQM
	 mUX+tnvx1OwO6AW8TVZX81xD/DBEZQTTwmYTs4EU8ACMnN/ak6p1wQdEmiqSxF7Oci1Rs
	 G93c59hUfN/C700zWcrdYzbDzP+h05DYHQJDu90ncOkNxsKjMKKLUIi++sTB8RWaVfkOZ
	 wq4QEr0LQ4Ws8w19EgfUgDtzEcxuIgPTT0qtxAtPQq2CkNQsfx/dYispJnZOba5Ib2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569416;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jked989Wm6FppPr7MFJfmU9vDNyU6OMjfFg9DB/ClYk=;
	b=hH821ODqp1KRye4EBz35QZ/JBEjy5O9nXeGcHYDu1od+38Aquba5UzpZTafcuMrt3XBK
	 ZrOL28t6st4zAB2ktFqd9TIYxDkdffVQOQ+2k0e1wKkNLdHf8nvQrXR7+wTx+YwcMUZ2r
	 3pj/S/3eKpqAu167DLCnI984dPd/KH5tv0v2/H12bPtReL05zshpscVRNlX+pifPCEMZP
	 hXucgY532XSQWubXno1WWD/uea1NSIEYAuT+3xLYkdo/TCLM9uRXQ4IpaxBWqpdfBEawE
	 e9vL1U6MBEnfNScYwM7p+C8VNJ9Nm/dHYAkDeb+XpWsnE80V+iW1TMxxyKLPD0JWpww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=VZQGMtD3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.21
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010021.outbound.protection.outlook.com [52.103.32.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57314606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57314606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=VZQGMtD3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUmUCPaxMMXKnDNcKO7GnHil2b1Tb8Z3aAqeaZ6VhM4xqR/tzrORDt4189ERSyg/SnrqAbp8/Qlfc2l6UAPNJdOaefqu/B3/+GczNlqhxgrBlUqXMKnQFaRpRa3Um+453AXwKl2Jp7iO5GtUIO/MRY96xMFUKxY6ubXr5mK9NnWdqHjXHTEYa2KQnQ6+U/XJs5DEByGoz/4vXrtFRr4GAjxHhdX/3yMg31Z4Cl3JXojXj7RsZBTvpG1hXFWNMvYy69I6+oYtFoFbPF4kA4Qsqw7+h87gTwHxt2y20xwX57sBPzws6mdbJiwidUP6cUPKMdJYrQxhKH0BCORA98r92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jked989Wm6FppPr7MFJfmU9vDNyU6OMjfFg9DB/ClYk=;
 b=yB8P2DRk35vnIkdg+1cLBJ0Iul5T4U7VEmj/qxtB2ZXmoP5dbpbw2QdT/49ONKrRPsoIIm6zGy8WCLcXHB2POP2X/G8UEjdgtD0iZUlKc7wyseTbmjb0MOM3oRFpYnLXFiHzM+KcTGAxyG63Up/kJM0k9nGSbvcqh8+79BfrtdwJ0xEJ2caHJevfJLb7yqq1aeRqbH79G3XuryuHeE2Plcb3GPY2YvmqAHWdzbNLv0QaeeboLiCiav934y3wmzPlDI6JW4l2iAbwA15EsMVrJ3VYbm7dDALkneKPq7Awd+T6dxwWR5fkuFUd3MqROebiG4fO1Qdfjbel54K30Z34zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jked989Wm6FppPr7MFJfmU9vDNyU6OMjfFg9DB/ClYk=;
 b=VZQGMtD3YJ9CvdqnrSiqTsbRWzCHLj3ZYI7Tt8636hTcksUl0JUKv8dsSs6JF4ArVYfn9U1Kg4sX2UobtYMFEy5vmE4yBetZWZHuSHWvpRBm4yxwkhg6RAQmuxinmo8KQB4a1s/kBola0sF1eUXtC3bLenamzRXfevqVFlZm+ojbmkzE7OYTuZc7aGDNE4FXkKgCv5BJZuymfCEtZ/zFStILQN6ucnBT3P/jA/QyreIVEaSgonUhebyM1eco9e9oY8XQKhkhWLpjISy6yk783Eq+Z7ZfHO/6NZlsLtV1OpVS0fJkL88rwZ9O2ICqqjzpG18dzIIRfOvS4Qmn+eCaMQ==
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com (2603:10a6:10:3fe::21)
 by AS8PR08MB6600.eurprd08.prod.outlook.com (2603:10a6:20b:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:16:51 +0000
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420]) by DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 01:16:51 +0000
Message-ID:
 <DB4PR08MB91893C9A65190A794EE28FC891432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 02:16:49 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH wireless 2/2] wifi: cfg80211: tests: add multi-link probe
 responses on non-MLO bands
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, benjamin.berg@intel.com,
 miriam.rachel.korenblit@intel.com, lachlan.hodges@morsemicro.com
References: <56a60324-85ab-4eb1-8f74-eda61b24c246@live.de>
Content-Language: en-US
Autocrypt: addr=m.vanderwijden@live.de; keydata=
 xjMEawIisRYJKwYBBAHaRw8BAQdAhSt8XBoKcVuzaN2I1VFbR8o03wLSBTtprzeKdDTLLmLN
 L20udmFuZGVyd2lqZGVuQGxpdmUuZGUgPG0udmFuZGVyd2lqZGVuQGxpdmUuZGU+wo8EExYI
 ADcWIQTMEyts92CDKwC/+p7K40LVK7aRSQUCawIisQUJBaOagAIbAwQLCQgHBRUICQoLBRYC
 AwEAAAoJEMrjQtUrtpFJIFUA/AkdYmKA15B26VPa6XNZInO25k1iDmlw9nGUfrMeq9IsAP9y
 JvMBlSzBrOsPOO3IUma8dXlqXvZVpl6W7D3KPAX5Cc44BGsCIrESCisGAQQBl1UBBQEBB0Dm
 fcqAiSmFwZxMqLGOinFMo7z03kaO/ksCvCiQK5p2NgMBCAfCfgQYFggAJhYhBMwTK2z3YIMr
 AL/6nsrjQtUrtpFJBQJrAiKxBQkFo5qAAhsMAAoJEMrjQtUrtpFJQn0BALNFi/S3m+kqFQqh
 fQg3VAWd3GzjgxGnIM8JoLG7RY/aAP9dRyTomx1sZDi1LJTRGqOfT2Kd5sU2iAPsEBA5wZfE Cg==
In-Reply-To: <56a60324-85ab-4eb1-8f74-eda61b24c246@live.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::12) To DB4PR08MB9189.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::21)
X-Microsoft-Original-Message-ID:
 <9a9a12c0-24a6-4165-9b0e-1cbc2ef18882@live.de>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9189:EE_|AS8PR08MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f41db72-3175-4ef8-50c4-08df4a91c8e7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|51005399006|25010399006|24021099003|55001999006|25031999004|5072599009|15080799012|6090799003|23021999003|41001999006|10035399007|40105399003|56899033|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTB4N3Bybi83c3VjTU4yWnI1QXVYWE5makNEUk4zVVlycHlFSFRkZkdCRXFv?=
 =?utf-8?B?bzJxalpQbVlLOGxaeng3WHg1bzNKcVBIV1ppSERDT3VEYXg3OHUyV2w4MXgx?=
 =?utf-8?B?QVRxN2hrNmp0WGZ6dUZ2NVFXT3FUdUlneFBuSlZ4NWNVU2FzRHJuaUUxdk5w?=
 =?utf-8?B?T3hyM001c3VtbU9ZNVFQV05VN0ZCRXJVRlVyOUFqekxlWGlqU0R3MTNnc29P?=
 =?utf-8?B?VlFveENQQ1RRbTIzY1VYMTB0RUNGV3orbzZZeGd1M0d5V3FFQVo3WDdvZG5y?=
 =?utf-8?B?Y0NTUnVQUlRpdURINVVKTllkdTBCV256VWdyRjJKaG5sY1FpejlTd2pYYXN5?=
 =?utf-8?B?TXFPU1RXL2FhKy9na0JJWXk3c2Y2NVRlWEljV0hZMDRlMUF1alY0dVJLamw2?=
 =?utf-8?B?cjdxY0hDRUxwakJWOTFKaXhBNEtrOVBkR0pzWDE5TGo4YllTV3JVTCtsMk9a?=
 =?utf-8?B?eGc2TklTQkdIVTl3SFV0K3dqeCtnYXFOb0gwYk9oSnNpcFcyN0FMYlEvam9I?=
 =?utf-8?B?cmJ4S1c4UkxRTkZkV2VEK09RL3FVNXg3YzBaZ3FoWXA2ZDhleERiMFJyZExp?=
 =?utf-8?B?eCtZbkhQNFFWWURBREVGMGVQK0czNW1hRFhPVmc5a0hLN2cvelo4QVNyY2pz?=
 =?utf-8?B?UFZtaUxmV09RdFBIMitWWkYvRktVcklXRFA4ZDVMbks3bFlzRGQvSmEraDYy?=
 =?utf-8?B?WlZMTTFBY1YxSlJCWTBpaVhudnhsZGxJeGF5cFdOUllub2tYZWtiWHhxZHY1?=
 =?utf-8?B?MnduWDRWZ2ZjVWc2Vkk5R2wwR1NHcEZNMGRwVjFSdnJudjBIV1lsQVhBMnBu?=
 =?utf-8?B?bnNWLzkyRmNEMnRPRHVEdEU0Y2R0NGFFT1VvT0xnUzJGQjB3SWxVbEMwcEg4?=
 =?utf-8?B?NUE3RUZJYkdmYXdkWXJrWTBIY3Vwa1AwaFRSQ2VkVHZTZHBSaGtQVHpNalIr?=
 =?utf-8?B?VFZBcXI3Z2wxcDgxY2tYbktUOXZJNW5kY1dGMUFSQWJycHgyeCtYRWt0dzdB?=
 =?utf-8?B?YmxCbnRScEoreklwNUUrY0xFMzR6SVpLYjdkY2RFdVFCenR4VjNpMkx5aUlH?=
 =?utf-8?B?RVBMNDEzdmhOakN6eFd4WC9XTG5RbTJPWkJDelpLRUpLekN0cUZ1LzhvUkRN?=
 =?utf-8?B?b0Z3T3ZiM2dXVW9UVllvbDA2MmhHcWRmTEoxclJQaVFINE04ZkllKzJocGJS?=
 =?utf-8?B?dHN5eVNldEdFS3YzTTJjcllJQW55TWpsU2lVRVhnM3dkdDFuNld0U2RWNFZI?=
 =?utf-8?B?YmhkdUthc1haSmxReDROMGZ0bmMyUVY3eGMxeGtMaExWL0pGbGpIcHNzL09j?=
 =?utf-8?B?eXFPZG9oam1DK21EUWxHWUlBOVZYYXRLYjd3WHFrUUt6SzF5TnRHMVlXdjVy?=
 =?utf-8?B?VTErYUpHUzJPWWxwamI0bmc2eUd6bUlZTTE3THNqU3BlVFE5TFJITTZWTnAx?=
 =?utf-8?B?Mk8yQlRNTEhzZ01mSmp5bWk0ZUxvU2xXaWQ2QVVTQmVNZzhGMTNVbC8rU0JU?=
 =?utf-8?Q?S0EzwY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R29tU2NUOUFVaEFvdmJncXNYVlRqeFZsdzJBbGNUdnNSaFNwTllORUtUd25i?=
 =?utf-8?B?cUY3QnVWV2YwUllmdGo0Q1o3cFFuNkk1SW53dGU5c3hNdlU5b200QXN4ODJR?=
 =?utf-8?B?WVpiS0l2OE9KMmhQODRtVXNVVXNTOStkRHhvZk9NUTcya1k0Ym5xc3lsQVBF?=
 =?utf-8?B?b05NNnQ5WFM1Rys2QU94amVUOCtDeElpSXVwSDJ2dG1uc2lpWTZ2aWhVazZw?=
 =?utf-8?B?QmdGVytmMU52WVFQc3dmSVpQQ3V2TnhVREE1NkFNdEVGQzZieFNBVGh4a0VQ?=
 =?utf-8?B?KzkwM0tVOEhCaUo3QndqeXVVS3NiUXRQdytJSU1QNDVXcmlISlc3eWhHRnJs?=
 =?utf-8?B?YjVQQWF2Rm04RnJsMHl1NDF1bWNFeEx0MUlLNUdXWk9PcnJTYWVIWmx5U2RL?=
 =?utf-8?B?cXNLdUJzTzdCWU9LRWVaQll0Z3p6QWFVNUhnUWFoK1hha1Y4T3p3VjFJMU9t?=
 =?utf-8?B?UFVLeE9NNXJwNHkxSTlsc2JCOEdzVmJ1MWFIR3V5WUhTMmdrSk9zZkpDQkhk?=
 =?utf-8?B?WUIxSkh0UTdWUTNVc2FTUEJtWDY5ZU5SWHpzWXBWZkd1eU1xTUlkN25Oa2NM?=
 =?utf-8?B?ZjVoeFFZV3dKZjRuY0p4Q1paZzZHS2RCL0pQN1cyQk9OMUlNSW1TUzlvc3Js?=
 =?utf-8?B?c0h0OUpNL1I3bERYQWEwOFlCamJpWHJ4NDh2bEVvNnQ5SHBqbHRQWjhST29p?=
 =?utf-8?B?bDlkRjM2cE81WVN6Z25SQ3pRUVV1V3c0SGFPbS9VVW15a2lDOHI4MWRSR25x?=
 =?utf-8?B?Yk5FZ2NXZEM4STFnZW1NSkRCZFEwa2VWaVlYbURkYjNqVzZZSnp4ZnpvdFpv?=
 =?utf-8?B?OHcrY1NqUFZHZE5Fcmhrc2EzYkVoWVpCMnFOaU41cnFMa096MzdiZTNSTisv?=
 =?utf-8?B?aUJxbDJpTUlwODZPd1UzMk53d2ZXWWlGS0RvdDlFR3MxdGpvZFJZNHRXcFBN?=
 =?utf-8?B?dG9IN3FQaHp6dEdOZlBXWGtkK1hnbDZab3pMemttWnV3SUtKR3J5Z2F5MFRa?=
 =?utf-8?B?ZXFTVTRmREZXRG5GcEhMNk1zRUs2VjNSQmVDTWc3RDRGKzNPaEJOU3llRHlK?=
 =?utf-8?B?dFE5NWt5Ym9vUDFpS0R6MmVkMXNwZ0VQMUp0T3NvMkgwRkhLeFRmb3lvMkRB?=
 =?utf-8?B?UGFxUlFXV29KenAxMzhGVjNwdUZEaTBhUUxHU2IxdUZPcm9zN2hGb3AyNURu?=
 =?utf-8?B?dFNGc2w3VUx1MU5NVkF2T1FrQXVNV0dvU2FCd3FXaTMvNnNhZXVZZmNFRWhz?=
 =?utf-8?B?c1IydS9SMGxISWlPTUVxTWVlWDJpL0FvZEMvTHBEaXhMUW5DM2ozVG96WHox?=
 =?utf-8?B?T0U5T3JXTWpabXJvc0pnOHNad0hBd0l4RVlkVzEwM0lLc0drbHFSa29NUCtz?=
 =?utf-8?B?OGNwdWVYcUJVRzdXTWFDMVRMaFBKdjBudHZMNmpIRHU1cFgyU2Jia1RWaXR5?=
 =?utf-8?B?TWFwejk1Nm1qMnA2V1YrNURTRGxIaWJZcjZQc1E0c0tlcWtOcCt2VjJWTE9V?=
 =?utf-8?B?TTIrRXlJbk03eUNOYndvM1l4ekcydDNUZ0lmdXVNUUhlUWF2WkFwQTZYSlpS?=
 =?utf-8?B?L3hkVkV3L3FzUXJkYjBVcWUydll5MFdieXM2amRlVmV5aCtpNHhNSjhWTDdX?=
 =?utf-8?B?T3BIcE1LNXN2TWhNV2tLdEE1TkpubC9zREZCbUZNdCsrVkJwQmdicDJhSGNJ?=
 =?utf-8?B?VUhkRjNUS3l0ZEljRE9Td2ZCSS9aeDVySlRUOFcwckpVaUJlRTBPdVdFbTdF?=
 =?utf-8?B?M3kwNmYxcXNna2RRSmVpOElraS9lQVhBNFJpdzg1VHp4dWk0YnpVNVVrdXdP?=
 =?utf-8?B?NnZUWVZUM1FQOEViQWova1dnU1ZsMTFBV3ozbFNhSC9tVFJEc1VNOXFOTlJQ?=
 =?utf-8?B?UnQvSzRtSmxkNVhIVEJhUVZyWGNRVTNKWHZhZHZiWkM4STdGWVkwZDU2VTJi?=
 =?utf-8?Q?es9QgpjgFk6gINlX1xxoCOrNYc5oQ2rP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f41db72-3175-4ef8-50c4-08df4a91c8e7
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9189.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:16:51.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6600

Add a 60 GHz and an S1G channel to the test wiphy, and a KUnit test
that informs a multi-link probe response (MLD ID 0, one per-STA
profile, no Supported Operating Classes element) on each of them. It
must not trigger a warning or create a BSS entry for the other link.

Without the previous patch, each frame triggers the WARN_ON in
cfg80211_chandef_create().

An AI coding assistant was used to write this test.

---
 net/wireless/tests/scan.c | 99 +++++++++++++++++++++++++++++++++++++++
 net/wireless/tests/util.c | 10 ++++
 net/wireless/tests/util.h | 17 +++++++
 3 files changed, 126 insertions(+)

diff --git a/net/wireless/tests/scan.c b/net/wireless/tests/scan.c
index 8c20278b5d3a..0681f2c8eff5 100644
--- a/net/wireless/tests/scan.c
+++ b/net/wireless/tests/scan.c
@@ -790,6 +790,104 @@ static void test_inform_bss_ml_sta(struct kunit *test)
 	cfg80211_put_bss(wiphy, link_bss);
 }
 
+static const struct inform_bss_ml_band_case {
+	const char *desc;
+	u32 freq_khz;
+} inform_bss_ml_band_cases[] = {
+	{ .desc = "60ghz", .freq_khz = MHZ_TO_KHZ(60480), },
+	{ .desc = "s1ghz", .freq_khz = 902500, },
+};
+KUNIT_ARRAY_PARAM_DESC(inform_bss_ml_band, inform_bss_ml_band_cases, desc)
+
+/*
+ * A multi-link probe response received on a band without multi-link
+ * operation must neither warn nor create BSS entries for the other links.
+ */
+static void test_inform_bss_ml_sta_band(struct kunit *test)
+{
+	const struct inform_bss_ml_band_case *params = test->param_value;
+	struct inform_bss ctx = {
+		.test = test,
+	};
+	struct wiphy *wiphy = T_WIPHY(test, ctx);
+	struct cfg80211_inform_bss inform_bss = {
+		.signal = 50,
+		.drv_data = &ctx,
+	};
+	const u8 bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x66 };
+	const u8 link_bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x67 };
+	struct sk_buff *input = kunit_zalloc_skb(test, 256, GFP_KERNEL);
+	struct {
+		__le16 control;
+		u8 var_len;
+		u8 mld_mac_addr[ETH_ALEN];
+		u8 link_id_info;
+		u8 params_change_count;
+		__le16 mld_caps_and_ops;
+	} __packed mle_basic_common_info = {
+		.control =
+			cpu_to_le16(IEEE80211_ML_CONTROL_TYPE_BASIC |
+				    IEEE80211_MLC_BASIC_PRES_BSS_PARAM_CH_CNT |
+				    IEEE80211_MLC_BASIC_PRES_LINK_ID |
+				    IEEE80211_MLC_BASIC_PRES_MLD_CAPA_OP),
+		.var_len = sizeof(mle_basic_common_info) - 2,
+		.mld_mac_addr = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x60 },
+	};
+	struct {
+		__le16 control;
+		u8 var_len;
+		u8 bssid[ETH_ALEN];
+		__le16 capabilities;
+	} __packed sta_prof = {
+		.control =
+			cpu_to_le16(IEEE80211_MLE_STA_CONTROL_COMPLETE_PROFILE |
+				    IEEE80211_MLE_STA_CONTROL_STA_MAC_ADDR_PRESENT |
+				    u16_encode_bits(2,
+						    IEEE80211_MLE_STA_CONTROL_LINK_ID)),
+		.var_len = 1 + ETH_ALEN,
+		.capabilities = cpu_to_le16(0x1234),
+	};
+	struct cfg80211_bss *bss = NULL;
+
+	KUNIT_ASSERT_NOT_NULL(test, input);
+	memcpy(sta_prof.bssid, link_bssid, ETH_ALEN);
+
+	inform_bss.chan = ieee80211_get_channel_khz(wiphy, params->freq_khz);
+	KUNIT_ASSERT_NOT_NULL(test, inform_bss.chan);
+
+	skb_put_u8(input, WLAN_EID_SSID);
+	skb_put_u8(input, 4);
+	skb_put_data(input, "TEST", 4);
+
+	/* no Supported Operating Classes element, MLD ID 0 */
+	skb_put_u8(input, WLAN_EID_EXTENSION);
+	skb_put_u8(input, 1 + sizeof(mle_basic_common_info) + 2 +
+			  sizeof(sta_prof));
+	skb_put_u8(input, WLAN_EID_EXT_EHT_MULTI_LINK);
+	skb_put_data(input, &mle_basic_common_info,
+		     sizeof(mle_basic_common_info));
+	skb_put_u8(input, IEEE80211_MLE_SUBELEM_PER_STA_PROFILE);
+	skb_put_u8(input, sizeof(sta_prof));
+	skb_put_data(input, &sta_prof, sizeof(sta_prof));
+
+	kunit_warning_suppress(test) {
+		bss = cfg80211_inform_bss_data(wiphy, &inform_bss,
+					       CFG80211_BSS_FTYPE_PRESP,
+					       bssid, 0, 0x1234, 100,
+					       input->data, input->len,
+					       GFP_KERNEL);
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
+	}
+	KUNIT_EXPECT_NOT_NULL(test, bss);
+	KUNIT_EXPECT_NULL(test, __cfg80211_get_bss(wiphy, NULL, link_bssid,
+						   NULL, 0,
+						   IEEE80211_BSS_TYPE_ANY,
+						   IEEE80211_PRIVACY_ANY,
+						   0, NULL));
+
+	cfg80211_put_bss(wiphy, bss);
+}
+
 static struct cfg80211_parse_colocated_ap_case {
 	const char *desc;
 	u8 op_class;
@@ -972,6 +1070,7 @@ static struct kunit_suite gen_new_ie = {
 kunit_test_suite(gen_new_ie);
 
 static struct kunit_case inform_bss_test_cases[] = {
+	KUNIT_CASE_PARAM(test_inform_bss_ml_sta_band, inform_bss_ml_band_gen_params),
 	KUNIT_CASE(test_inform_bss_ssid_only),
 	KUNIT_CASE(test_get_bss_miss_reason),
 	KUNIT_CASE_PARAM(test_inform_bss_ml_sta, inform_bss_ml_sta_gen_params),
diff --git a/net/wireless/tests/util.c b/net/wireless/tests/util.c
index 118f7fb4226d..850898e9f2d4 100644
--- a/net/wireless/tests/util.c
+++ b/net/wireless/tests/util.c
@@ -33,6 +33,16 @@ int t_wiphy_init(struct kunit_resource *resource, void *ctx)
 	priv->band_2ghz.channels = priv->channels_2ghz;
 	priv->band_2ghz.n_channels = ARRAY_SIZE(channels_2ghz);
 
+	memcpy(priv->channels_60ghz, channels_60ghz, sizeof(channels_60ghz));
+	wiphy->bands[NL80211_BAND_60GHZ] = &priv->band_60ghz;
+	priv->band_60ghz.channels = priv->channels_60ghz;
+	priv->band_60ghz.n_channels = ARRAY_SIZE(channels_60ghz);
+
+	memcpy(priv->channels_s1ghz, channels_s1ghz, sizeof(channels_s1ghz));
+	wiphy->bands[NL80211_BAND_S1GHZ] = &priv->band_s1ghz;
+	priv->band_s1ghz.channels = priv->channels_s1ghz;
+	priv->band_s1ghz.n_channels = ARRAY_SIZE(channels_s1ghz);
+
 	resource->data = wiphy;
 	resource->name = "wiphy";
 
diff --git a/net/wireless/tests/util.h b/net/wireless/tests/util.h
index 6de712e0d432..fc058534df28 100644
--- a/net/wireless/tests/util.h
+++ b/net/wireless/tests/util.h
@@ -30,6 +30,19 @@ static const struct ieee80211_channel channels_2ghz[] = {
 	CHAN2G(2484), /* Channel 14 */
 };
 
+static const struct ieee80211_channel channels_60ghz[] = {
+	{ .band = NL80211_BAND_60GHZ, .center_freq = 60480, .hw_value = 2 },
+};
+
+static const struct ieee80211_channel channels_s1ghz[] = {
+	{
+		.band = NL80211_BAND_S1GHZ,
+		.center_freq = 902,
+		.freq_offset = 500,
+		.hw_value = 1,
+	},
+};
+
 struct t_wiphy_priv {
 	struct kunit *test;
 	struct cfg80211_ops *ops;
@@ -38,6 +51,10 @@ struct t_wiphy_priv {
 
 	struct ieee80211_supported_band band_2ghz;
 	struct ieee80211_channel channels_2ghz[ARRAY_SIZE(channels_2ghz)];
+	struct ieee80211_supported_band band_60ghz;
+	struct ieee80211_channel channels_60ghz[ARRAY_SIZE(channels_60ghz)];
+	struct ieee80211_supported_band band_s1ghz;
+	struct ieee80211_channel channels_s1ghz[ARRAY_SIZE(channels_s1ghz)];
 };
 
 #define T_WIPHY(test, ctx) ({						\
-- 
2.56.0



On 11/25/26 2:15 AM, m.vanderwijden@live.de wrote:
> For a probe response with a Basic Multi-Link element that has MLD ID 0
> and a per-STA profile, cfg80211_gen_reporter_rnr() adds an RNR entry
> for the reporting AP. If the frame has no Supported Operating Classes
> element, it derives the operating class from a chandef it creates with
> cfg80211_chandef_create() on the channel the frame was received on.
> 
> Since commit 92d77e06e73c ("wifi: cfg80211: restrict
> cfg80211_chandef_create() to only HT-based bands"), that warns when the
> channel is on the 60 GHz or S1G band. Anyone in radio range of a
> station scanning on those bands, e.g. with wil6210 or mm81x, can
> therefore trigger the warning with each such frame, and panic systems
> that set panic_on_warn.
> 
> Multi-link operation is only defined for the 2.4, 5 and 6 GHz bands, so
> ignore Multi-Link elements in probe responses received on other bands.
> 
> The warning was found with a userspace fuzz harness around
> cfg80211_inform_bss_*(). An AI coding assistant was used to analyse the
> finding and to draft this patch and changelog.
> 
> Fixes: 4d1d6b3f4599 ("wifi: cfg80211: add RNR with reporting AP information")
> Cc: stable@vger.kernel.org
> ---
> Notes (not part of the commit message):
> 
> - Testing: KUnit on ARCH=um (all cfg80211 suites), with the test from
>   patch 2/2, on master 8d7fe9885c62. Without this patch each frame
>   hits the WARN_ON at net/wireless/chan.c:34 in
>   cfg80211_chandef_create(), called from cfg80211_inform_bss_data(), on
>   both 60 GHz and S1G. With it there is no warning, and all 59 cfg80211
>   KUnit tests pass, including the existing 2.4 GHz multi-link probe
>   response test. Not tested on wil6210 or mm81x hardware.
> 
> - Independent of my series "wifi: cfg80211: fix BSS reference leaks
>   with hidden SSID and MBSSID"; the two apply in either order, and
>   together all 63 cfg80211 KUnit tests pass.
> 
>  net/wireless/scan.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 1c50a16c0e9b..9c873f51cb11 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -3270,6 +3270,16 @@ static void cfg80211_parse_ml_sta_data(struct wiphy *wiphy,
>  	if (tx_data->ftype != CFG80211_BSS_FTYPE_PRESP)
>  		return;
>  
> +	/* Multi-link operation only exists on the 2.4, 5 and 6 GHz bands */
> +	switch (source_bss->channel->band) {
> +	case NL80211_BAND_2GHZ:
> +	case NL80211_BAND_5GHZ:
> +	case NL80211_BAND_6GHZ:
> +		break;
> +	default:
> +		return;
> +	}
> +
>  	for_each_element_extid(elem, WLAN_EID_EXT_EHT_MULTI_LINK,
>  			       tx_data->ie, tx_data->ielen)
>  		cfg80211_parse_ml_elem_sta_data(wiphy, tx_data, source_bss,

-- 
Marius van der Wijden

https://github.com/MariusVanDerWijden

