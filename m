Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795770929;
	b=hVwAmBuB5UytI9O1lqcP8a3ltiTmlwjbcKH1MCHCF/4PGn+uWZ1ByhmReta1Os00NGIT
	 Q5o3qBU7sQ9AZXTCsJvqxoKKT6uJqXdnXtOGcNYBa0NVviaWV7Euy71zziRVF9hNsAgzr
	 n9iva1WDQopWG7n0PFAVakw3y1/zJJl4asvh+D+hdP1JYp0eFzhriLPAa8hEWuj4s7P7+
	 +aMYgEBTHhKzKRNimFfu3utoU4Os0w+hsQuyDznsYDCQpcwJGbfjPSPZ2PEo7mtJd8W0z
	 Ug6DAcEJE9DbBYNQYosp0V7uL2yUQCY/u9e8L3blpNG/AVYK3uwnNO0haFDT9nDheAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770929;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-CACHE:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:DKIM-Signature:Received:Received:
	 From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=4HKiOCNjCKGxJkMUVHV8ZtEKJr/vm+mnOvNjMxfSdxQ=;
	b=JVBb7S/CFLJ2figJ/UDr+pKDElTicwK0fCsVhMd4Apw1ZhXDbdQT7SfVhTuHDjgjCIn9
	 fzTCEm7gYXmP1NbSCf7KwqXNoj5KIIWDIDMeKVnngYrPq2N8ZdpL1NYV96fxgGTNJ5FEE
	 CP3fr2rxTRp033U4IkmvGOtX8FqX6NTrHz69EFA8HUdRD9NZw1oshyjnd8jrc9XQvDXoI
	 QNlZJNu7pzASjJPAxvRwr+FXeDt5aAQEgwT62uNA3pmzbr1EXlWV6TjlcAZNX/QZp6p11
	 aJ+E5G69IQ7Sz9mn9eblFg9AONjhWoBCQAeHRTwz8NVV+E/UJ/cEFpUpG9rvj8Dq5rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=gtJtxl5X;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=sZ5LUYH5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBB606A323
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=gtJtxl5X;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=sZ5LUYH5
X-UUID: 14fdfc0cea4311f1a7aecdb2598be72c-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=4HKiOCNjCKGxJkMUVHV8ZtEKJr/vm+mnOvNjMxfSdxQ=;
	b=gtJtxl5XIDr83ZuE7GCAV5Li35mGoeOEPRy+//zLEq4w7DZG7fiXDn4bWz/Yplu3R4eOJ0plXTrwbiRiR8D2s1XnHUNcoo3V6ay8y8q2jRPh8XltzXDtUJCX/KycgcSVyxB0Cirng58rD5Q7lnA6hrEuCSFYZ6rzIkwawlJ0aBY=;
X-CID-CACHE: Type:Local,Time:202611271711+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0d03e712-493b-46bb-8d6f-0877434746a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:c9bb231a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14fdfc0cea4311f1a7aecdb2598be72c-20261127
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1869730823; Fri, 27 Nov 2026 17:15:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 17:15:24 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 17:15:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkcq3EDXZ5fukcymFK6/l3rFZovvYYiYUpR9uP/JGjg6pSJv48djbC4CUbDaaHq+hp7Img2zHhttQRw7xF0zs8vptuHzpEpVBXs9NyP04JiVSG0fuLTo5ivJGIKJt6q4/556XHPQq/WBCMXrk6CBH0ZZ3vMWo2kipTjywATbRqxXls49TpmYRdxgWXzKkY+AWcdmhgWkyh/8AqXDw5L9VEG2A7zcY2AW6zg9up5vfXdsl2hTAkzKM9Qx4I2j+XRpLzK8qJX6pa/1KN4qAf8qWMDzOCyBl6vJ/7W+VzYW6oJRgrohqQW53HM3CAHfGN9lNfM/6o6jd2iDnZ7H081cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HKiOCNjCKGxJkMUVHV8ZtEKJr/vm+mnOvNjMxfSdxQ=;
 b=R7J5IPpy+3KRgSwnMJ7ppLlQD35I2rFuM8KcNyTCpCzBDDi0PZh0qx9/PftzEMPm7YDpR1aQLrP5LaT2biZ/fWMApvlDmImk/9yYUOC3q/knfR2wPAUy3G+ORlWG1z9e7R8+ytQrr0TSlweWLuwTnzWt5uIaTR9+n6bjhx6QrgWwBVbgj/B5SzTpCccS1nRJSx/qoH9GT1kVreEPpr5W4AxEwuMExxQaPl14rJ7h4wISchZS61YwwG5YMoXBjqxkcAztkWd1hNhoFenc6hJHRa533PsSdhIoJgXWQk/PqmzusW1T40beWItod357CVPIq929vB0D+T9FdQsiugsc+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HKiOCNjCKGxJkMUVHV8ZtEKJr/vm+mnOvNjMxfSdxQ=;
 b=sZ5LUYH5f5zAi3tNGM0MGhuaNJU6Yf2Sy1x0+Az4yz0Qf+prJS2q9h25XhoOVFWcpgWrHSBGCFoJSHvq7De0OHQfxFe8lbSGMW/PLSn6KkNLDc20FXHQ4kvNOoApo+VYMlRP0/sulpr7KurxDd2N6i627OGblQbH7fe8HBVVdC0=
Received: from PUZPR03MB5990.apcprd03.prod.outlook.com (2603:1096:301:b5::10)
 by SG2PR03MB6707.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 09:15:22 +0000
Received: from PUZPR03MB5990.apcprd03.prod.outlook.com
 ([fe80::15b1:fccd:e3ae:f89f]) by PUZPR03MB5990.apcprd03.prod.outlook.com
 ([fe80::15b1:fccd:e3ae:f89f%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 09:15:22 +0000
From: =?big5?B?QW50aG9ueSBMaXUgKLxCqH20ySk=?= <Anthony.Liu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: =?big5?B?RW1lcnkgSHNpbiAoqK+p06vFKQ==?= <Emery.Hsin@mediatek.com>,
	=?big5?B?SkIgVHNhaSAovbKn07FsKQ==?= <Jb.Tsai@mediatek.com>,
	=?big5?B?TGVvbiBZZW4gKMNDqH2+pyk=?= <Leon.Yen@mediatek.com>,
	=?big5?B?TGl0aWVuIENoYW5nICixaaXfqOUp?= <Litien.Chang@mediatek.com>,
	=?big5?B?UXVhbiBaaG91ICipUKX+KQ==?= <Quan.Zhou@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
	=?big5?B?S3VuIFd1ICinZMLUptwp?= <kun.wu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"lorenzo@kernel.org" <lorenzo@kernel.org>
Subject: Re: [PATCH v5 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per Tx/Rx
 stats
Thread-Topic: [PATCH v5 0/5] wifi: mt76: optimize mt7922/mt7928 T-put per
 Tx/Rx stats
Thread-Index: AQHdfk/UIR+LzlHIjUuoIgPFRQKKrQ==
Date: Fri, 27 Nov 2026 09:15:21 +0000
Message-ID: a996259a00d1239ea058648a145dfad1127b9052.camel@mediatek.com
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: PUZPR03MB5990:EE_|SG2PR03MB6707:EE_
x-ms-publictraffictype: Email
client-request-id: 461cba66-9721-4b34-b1e0-1f511a0933a4
request-id: 381c0033-2fc6-44ed-55e6-08df4c66f6b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10067099003|56012099006|11063799006|261026121527099003|18002099003;
x-microsoft-antispam-message-info: 0EQ6MjXB4VcdlgARDXZjgjnJAzFWzKCh/4C5+LN9X7yfS+UJeS/93S1cm8z1u8kc73B2qz8t8HoWmn0eddtcm1AbYopVlm+Yhrl5a9DUnGO1FWJdzHB+hfAU+o1Y85IM/E8JpuqTfPg/kyQ8TEKjCWkhz1tiJa7OvtbIEtCJNSmzBUB6W7ynB4L86FefsYmnGl0kz+D8rTd2QoJglC4fY/58CO+qmrBtM5qWWSrAEHPypUdMqmhyiXFPtLxls7r0GpL0PMibD24lHoxR8w5F6ucXJF1c2dGV9X32RCAShlMqwXsN3sMghyMjiVvwUBJYrFpXn4PKMjNubKsBWcmfXjPmhkOhKfxCgJAnSmQiU5u7OXaoSnfnF+MbcMUuykBP+A/HB2Ry4QhsKMjEMZZJozcFUX+W22H0GykLnFMWCqMdi8IJhnkF5b4r78ZZTI9WPx+S41nvin6dUA5dZgfP/oJXoWzjCVKxfVS2H3juu+TA9rN3W6F/YYgcJUmnvqO7ECk8WCmHDrk4s8dH275ahqIkeT3AmSpWpLLF10CLRISMkrB92RKIaYaM6IcyxaG9iN0bjoJGOVIzdFTKhFac1vJsXwuPVsbnYO3My4HcQgf81fmsdF80i7q52raeLAYTZ1zLJ2rpRNkps0O/b20st7edkTVQs1wk+K4bphmuHrk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?eWxwQlg5b3ovVnFoeVNFQUE4V1RBTXRHeEtVZUFNZkNaQ0dMNWVXR29mUjcrQ2tq?=
 =?big5?B?cHZtOUtoMlF2cnhDamN5R0lNaVZKdzlhVFpJWjBmY2kyUnR5dGR6dHFSMTVQUmxx?=
 =?big5?B?M3pyZkVvV3d4eFA4eGFRWlA5YmcxcXBRU3VLcHhhQUl3aDI0RWJIZk1ORW1TdVA2?=
 =?big5?B?WE9NMnhBSmE2cmVFeWh0aTlCOUZZZ3ZFVDdXZDg0K3ZTQlE4cGFFKzNNMmg5RlZS?=
 =?big5?B?K3NzWFkyaHdBYXk5ajhiZVNrRW9VTnlPZlJ5V1Qvajk4TlJBamY2dHNGVW5keThs?=
 =?big5?B?OFY2NldTaVR3TEFNc2ZIZDJxVFFYMFFRREY2UXdScnZRemZsZzExMGJiQXVSZmlv?=
 =?big5?B?VUtMSnNkd3I0d25JT3l5NUtNcmQxT0R4UEsrSkNsdFJGYllVNlNOWmptbS9RUVpT?=
 =?big5?B?Q3NpSHpUM1NFbHlUMG5MR2VTT2RzZkhtVHBraExPeFdWdjZOS3NvYmIray9GaXpX?=
 =?big5?B?Z05nTXFjNEkvOE10RTAxVWRYRDBVenFQbE9EV1hIcm8zcUpJc3UramdaWmpqVThO?=
 =?big5?B?UEtsNGNKcVh0cXR5ZEtmWGNmU3JFbHNneUpvM2JUUVQ1S216UHZHWnQxWXY1Umw1?=
 =?big5?B?ZC9Wd1ZBK25ibGJXVE1oVHZXUm9rN1FseDluVUtCaXY5THc1YUpia0N3eEZ1ZSth?=
 =?big5?B?aUoxVHZBOHM2bTNaU2FSWHN0SkZ2T1FtaWU4MFUvemlDSTFrVGNFRnVoSHJLTFdi?=
 =?big5?B?WEtiNStyOFI5dGpuYVNOQUluZm5vRkUxTktjZVNOdVQrS1NzemtCanBqOVB5dHZZ?=
 =?big5?B?QXlrOWFsKzNER0ROTlNlV0NLR3BoSElzeFE3V25IdjU5bHdHT0t2L1VZY29FM3BN?=
 =?big5?B?UFlRY2JtWVZQUVVMZU5BMjhzUG0vblRNcGZmUXhscXZYdjh5WGRMUWZZMkZVM0My?=
 =?big5?B?eFpUNEVGSGtNTUxuS2VOYlNJYXR3ZUF5cko0MjczdjBwcG1wTVhSelZmZ2Z6TE9a?=
 =?big5?B?am4rZWRpK3QwbFdJaTBuUVJ3OHVhdlp5dVZkQ2NvMG43dkZnWXF1cE1Yd2Jjd2hQ?=
 =?big5?B?eFgyTWZHMmJGNFRja21tKzJEQnh4ZU1NUHNCZXdIdHdpV1NoeFBSQk9FNGNSN0lp?=
 =?big5?B?eThybU9yTDY0NWxiT1hTbGx2clBCeUFKWENjM2Vkc2RjdHpsU2R3Um05ak1ReUs1?=
 =?big5?B?MUFRWFB5eGRzdEZoTEZ3WE5PMGNFTWlTMmhESzhqL3VMbVNaWWllVFNBVWgxaUhi?=
 =?big5?B?OU1LMXpQUG9lK1AzMzcwQ042K2dXMlQ5QnhSZHphVkRsTnVTb0tmSmllNk9pd3Vi?=
 =?big5?B?SnhCdnhMQTE4WDNHV0M4REV3UnFOZ0Z4RWt3MEtIdXgwSkpxdmpjZlB3U1pXcHRn?=
 =?big5?B?ck1HMUpodU1TTStNdTBMcXBCZDJIZ29oMnhBbW81d2lUaC8wSVdFdlZOSW56YWFq?=
 =?big5?B?KzVWRHBDZlNmR041d3grblZ0RG9wOFA3VjcraWZnL1lLZGliNFExaFpDN0pmOEpw?=
 =?big5?B?dTk1amJBUHBiWnA4VEcwY1lvV1JVczFBOXNzVWRrNXhtNEVGazRFU25zaVZWRHJq?=
 =?big5?B?VjBPeGxoWUkyNm1EbmR6Mys0WWo3N09WV25ENldFaGtmbVpEVUt5NnV2ejRDTDVV?=
 =?big5?B?OUNra054bGJraGI4cHArMnRzdFhmUDZMZXdLV3VlMVd6NHVIQmZheFUydWRSM1Yx?=
 =?big5?B?eE9scS9ibWtCUDRIeVkxcW4zeHFjRGhDRXN2TVFlL0I4K2dzclpUcDhZMm1FdE13?=
 =?big5?B?c3RUamJiMk15UVZzcjZJZ1dvU0kxSjFSNkdlczhSL2R5V01SQmY0cHI1bmpBS2Yx?=
 =?big5?B?KzVKNDNCdy9wMGlGZm5WSWNxenpRaEFObmZYdW81aFp4b3p0K0lPeWJNSWxPUXRB?=
 =?big5?B?eWp3aHk2TlhpQmNOVnlQOGV4OGZDNGJtelZ3OGp2VTlBeEpJbDZ2SGFsbDlDWlBJ?=
 =?big5?B?L3ZDZlRzWlJscjhHUTh1WU1RRjBhYmxTYXNFYzF6dXJuM2ZrVUxvY0tQb1JkVjRE?=
 =?big5?B?VG83SndNdis4MGt3TitPNVMvSTZpbXltS2FNbFYybXU3MlkwbGc3dktkeEFTaTJV?=
 =?big5?B?SjZ0MUx5Vm9IdUZadXVlZzh4MDNWeUtDOGRMSWlBUWFZZzNzeDJRTE9kVnkvUk9N?=
 =?big5?B?cEJFMjRnSzcydlJPZUlkZUJ3ZVZHRGU0QnM3YXE5MlB1N3Z2TjBUN2NtTmsyNWFr?=
 =?big5?B?bER0dHZBWU9LcklEbElncTlJVzR1U1dHN080WnJrdWNzbWdtbG5YSzBhdVJHaEc4?=
 =?big5?B?MGNxOHFiZVJLMDlwUDU3QVFSY1Izdz09?=
Content-Type: text/plain; charset="big5"
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
X-Exchange-RoutingPolicyChecked: b7eDD7UAwhzAWy0iV/HQ8gvNQwcQeX1L1dTjXXAC5ogxWvHC1vexTX+anWJCSHG0UG/I3Ycfz2SJTEOxc3d3LI1nsTQAZdjVrlouxYpIoZcgT9R0Jn3JVT7rJuaqETi5YNtNXkcH2z3alTXNHxfhgsDoSnmiM537drYg+j+qCPWMRjKveH9YzC9JLf64Q2it/FLxV6ukNQfTDVzPyM5XWHY0N59VP/u4O2ourxoX81FjqpwXvCvHrJq37oS4yI4FxLSnQzQMFt9lyG1WHoRdULnP/M5rEb23efUxK07f5RWEWtgFLymrQBtd6oXctTdSDVtvFxBXX0wchGybyHfQLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB5990.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381c0033-2fc6-44ed-55e6-08df4c66f6b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 09:15:21.9076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ef4fzhGw/pN7rCNemHXOZg7obH5Ovp9a9Zz69K4pyssl4SM9D9PuhbSKQF31daiXn5cRXiawBMbwQjXOEDlKA9Wh7jLirOUWJRWSEX72/2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6707
X-MTK: N

T24gVGh1LCAyMDI2LTExLTI2IGF0IDE3OjAzICswMTAwLCBGZWxpeCBGaWV0a2F1IHdyb3RlOgo+
IEhpIEFudGhvbnksCj4KPiBPbiAyNi4xMS4yNiAxMDo1NCwgQW50aG9ueSBMaXUgd3JvdGU6Cj4g
PiBUaGlzIHNlcmllcyBhZGRzOgo+ID4gMS4gUmVhZCB0aGUgSFcgY2hhcmFjdGlzdGljcyBmbGFn
IGZyb20gQUNQSSBCSU9TLgo+ID4gMi4gSWYgdGhlIEhXIG5lZWRzLCBjb2xsZWN0IGFuZCB1cGRh
dGUgVHgvUnggc3RhdGlzdGljcyB0byBGVy4KPiA+IDMuIEZXIGNhbiB0aGVuIGRlY2lkZSBob3cg
dG8gYWRqdXN0IFBDSWUgbGluayB0byBpbXByb3ZlIFQtcHV0Lgo+IFBsZWFzZSBkb24ndCBhZGQg
dGFncyBsaWtlIFJldmlld2VkLWJ5IGZvciBtZSB3aGVuIEkgaGF2ZW4ndCB3cml0dGVuCj4gdGhh
dCBteXNlbGYuCgpTb3JyeSBhYm91dCB0aGlzLgoKPgo+IFJlZ2FyZGluZyB0aGUgc2VyaWVzIC0g
d2h5IGlzIGRldi0+cGVyZi5lbmFibGVkIGRpc2FibGVkIGJ5IGRlZmF1bHQKPiBhbmQKPiBvbmx5
IGVuYWJsZWQgdmlhIGRlYnVnZnM/Cj4KCldlIHdhbnRlZCB0byBzaGlwIHRoaXMgZmVhdHVyZSBi
dXQgb25seSBlbmFibGVkIGl0IHdoZW4gYSBjdXN0b21lcgpyZXBvcnRzIHRoZSBpc3N1ZS4gVG9k
YXkgd2UgaGFkIGFuIGludGVybmFsIGRpc2N1c3Npb24gb24gdGhpcyBhbmQKZGVjaWRlZCB0byBk
ZWZhdWx0IGVuYWJsaW5nIGl0ICh2NiBwYXRjaGVzIGZvbGxvd3MpLgoKPiBUaGFua3MsCj4KPiAt
IEZlbGl4CgoKCg==
