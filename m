Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795566735;
	b=PUHF4lnR+KXpKv7nBe8GP3BeEW5XPKYtHf/bnNBNDAjAtav1GTKbuh6vK/rQwEsW1XWo
	 /3SqMB4VgPgBQUuhr2VbPgq7y05J8y2YvEfoLPXEo+iS8G+24Zbkii8VrTGIONAA1b2Uu
	 oJqET7GVmaqNNOu3mR++9OvS3wuRQgi8GFaHLugDqUiIlOvGv8dlSzwKmlOY5tMkqU5DL
	 cT9wF3Z2YtqcJsawQpFUJNgv1CkN57R/VZ0YoVnU8xtxl6Bvs8EoOjFhcOvSosa0gPXJ4
	 +2Aa0PIPRserSI+1gpQd5j93y/M8ICVh2ES7A3WpwEMa54XvLOnF8fyqOFTVUEXDW6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566735;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=o9HConLyeW7zy2y4ljB9fC1EvY06xLs6Gj1jQpB5qmI=;
	b=kwNsaBn1KZP0a7a4Arn++67A2nxyx0BOnq1RyliMX37lSEbVmKUA74TFpJuksEMVcTOK
	 7hQKGbJRBpfTUwoCsxVoMcX1u6/cVOnyUaX8tOM/7Ri1uqQBM2oHFLmLCa3d9ofw5bup+
	 hzvMBSrdtj4Ge313+mFynBfXxTLF6HkQHONtuWpUfRv3DzL9zZitEV7Dfehit6J6hsKXN
	 PyJz/6EdmW1pkA1jMYHL7C4YiULqV0ZTIn1Nl9oYb5sOOYxZn88qAYkqOB+A7GVRDiksP
	 4Hm8WeP+6IXERrb+RANboN2R0xOwLW21AVujYN0moHPxC1r/yUyTdRszAwlE5mB0oig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=X8BHwbJq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.43
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012043.outbound.protection.outlook.com [52.103.32.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632C606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6632C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=X8BHwbJq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GENXUQPJQLhgZjP0nARUdlOV3YP/JacvvyzxR+9VKtHWEKLFkIlGmb4sLrWhjPDQM6nYulHZi/NQAzmhteyOyq0s/GLDOJx5nDz8OyddJ0c5MZ2dCB+9kaeeCgnI7IS39A1fF5Kh0QkFdLZP79ICtkBiLLdtBAuBL21yj7lChnu6x0USbSEwkuHPJjUr6izMr1arK4QIVlGqmYnbbHWKqt+UmF5zffNaqQumHrUEcVCWuCAtuDC9MoPfQsNeEOGCnGz+taGtS6XrYThOimjxYtMQC8byUJsvKMC0Jh4t7HjW8j3H/ebALN8I0L2Vep7G/tQLtoKeWFsB3jCm8by+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9HConLyeW7zy2y4ljB9fC1EvY06xLs6Gj1jQpB5qmI=;
 b=NKrJAQ0zFS0k0w7RE/O1ORk4VUVjb58uEBRYbEDiDpUpcESGxsR4PhBWHeLvISDkGUxYtgy6xU+KtXa585Iobv6qTjpj740EHjoXj9EmqmgotzW827jmt3xs89iQnSbN3hfpDlVcMtbBDS3xTAQcH3ZMEsK7CMyQf71bI8vZqRnxj+lmrTqJkxfrAMvB3XXSKWiZ2xfd4sgblmQWwiVbraeofJuKiJvkPIZQLJEOjaIWK83Sr7kPWm+7waQciKAd2qvByUhzzrdq3i79kQMx4R8zIGE/qZvFyyrxZ0GxUWYINRvXU8FjyjgxtRvdb7Zq5cGxdDDGXSdrYJ1qLqwToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9HConLyeW7zy2y4ljB9fC1EvY06xLs6Gj1jQpB5qmI=;
 b=X8BHwbJqHssDbY/2fsEcH4zzk1EsnTJQJpCslDIoLSSpwRgyaPydqzK3qo7c0a8TmKLe3/l1pCyboA8oQ9YqQXOzwPKexq5egY6gd7Gf6IcnG+lZSGTCFL3aRDr70djPJrUaZpyDJkrIVF85NikLqpx5pMqhE/bWdQAjWBVRjDMIBJUL520o83AUkx9nS9w86lTSDEWyW701ywv18/4stj5P/6Xw5VGm86ZqZFFkarJH7gzm8cYnBhbXkE87gQAxRSHp+lLNta/YEwe9Ia+6UaQpM3kCm1dwy/s3EFVIMD36Rv003a49nWrT2t4ywGIp73A8TFi5bYH5BsnJABMAmg==
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com (2603:10a6:10:3fe::21)
 by DB8PR08MB5532.eurprd08.prod.outlook.com (2603:10a6:10:f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 00:32:11 +0000
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420]) by DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 00:32:11 +0000
Message-ID:
 <DB4PR08MB91895786130E60FABDAA108691432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 01:32:10 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH wireless 2/2] wifi: cfg80211: tests: add hidden SSID and,
 MBSSID refcount tests
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
References: <DB4PR08MB918981BAAB6C18C678F5594191432@DB4PR08MB9189.eurprd08.prod.outlook.com>
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
In-Reply-To: <DB4PR08MB918981BAAB6C18C678F5594191432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To DB4PR08MB9189.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::21)
X-Microsoft-Original-Message-ID:
 <c6b13ff6-e84f-4413-9111-36bf37728bdd@live.de>
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
X-MS-TrafficTypeDiagnostic: DB4PR08MB9189:EE_|DB8PR08MB5532:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b4711c-2cc0-4126-73e2-08df4a8b8bb0
X-MS-Exchange-SLBlob-MailProps:
	+bEufbke4JdvqmTQng7ItjpfaCLJSA3uqAKkIepCfxbIe8al84n32ovK5kpCJ86RrplaE0bGiCRHXibh3keizrCPmRjS4eM3z/rRamN/CLkLKpcSg1U4L1tewUKGEZBKtDLwdXA1CaCqyW/7DFysJFKSzAHlmS6KjKMOqvntUlVR/Sf6HqRt5nL3orO6naw5Nq2lzQTopYnUrvxv/wB5a9upFZdrr5Iq4r/y/uC1qI/jXparm16BBqMqkKyu1RjgA3snLYQmPrPPnpF+lNd12jFRkWAP3ReWsLtlNDf6AO3laLf0+A0MoEb6Lpmm/5sSXewNXiD5UOaliOOsmEzUokXI5vXJQ1cGv+LL/I1R5fzkfkwSVSpa3yxSmRjfrTSlp9048PjCIb/FuBGb9QNJXvU2CRRpHcdY2cB1WMJZ26MdhvWanbZYGe2aYYcn5TrO7oQlHSyduylp10B4CBumnmtWqZbYV4HJEBETY6x73qihsxbLIzr0ZAypQABoa6UAmYoEEv//R8DIzOYPxhpuaAUmdeoqEhfSOWVbCWMT2mpaSynF5s3O2ERXUYYnKdC7Ko1/drJLrBtmklZMmpksSE1EPjVst0CzvuNnFvqB/FFw8npr+4Ke9uepIVzJ5Iw+PUluN5lWAWza3H8wnzlTReoY2sIuF2zS/AkjyN+PCyp/zHlzZaifnfWJIAKq2/3gpBc7Th9sIw4guVEH1uKJsTJTQRXPEfcoC9GYLKEqV9EUIKtasV6YBS/AwRFyJzES/d+PmVprkgrn01IBl9OpAA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|25031999004|5072599009|41001999006|19110799012|6090799003|15080799012|23021999003|8060799015|24021099003|25010399006|51005399006|440099028|3412199025|12091999003|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVJKRDFZSHFSOEdUWFllbGtNMEk0SWpCQ043YnNZbU1rR1VIL0ZjUEtsc3gy?=
 =?utf-8?B?U1VzS0VObGhMcHVzcjF0TkZ2WW5aRi9BYk8vMXhzZnBKY3o2OUN0WnlPWXJO?=
 =?utf-8?B?QWdRcGl6Y2ttVU9nS2tOOFpvSm5FendxMFQyTnRmWlJZd0RFakRCc0Q4RFdq?=
 =?utf-8?B?VkJ2OXZxOVNMT20yYXRmUlVqVkpRM0FaNVRicm1qaWRPdkJTcml5YWF5c2Zv?=
 =?utf-8?B?SnN1QktNYXJhUm93QWlPdkdhcnJuWUFSTjZnYkJMQktJSXZFU3RRSkM1MlRu?=
 =?utf-8?B?OUIrSVFPNmhoTStEUThVWnM4bTdiMFMvTDNnUkVYZklOZ0pLbjRsMmlLRGdJ?=
 =?utf-8?B?VEZhT05lRW9qRlB1enRjZEJRdEJEWUg2OC9sUFcxNXlBYXVzRnZ6T2NocDZk?=
 =?utf-8?B?OWpIK29zZjNsNWdUczV3WUNFQUFEVDhTODB3NUEzRlhHTDF4UVJ2OVhleUdF?=
 =?utf-8?B?cDVmZE5IUzduOWYyM2NTdEI0UTgrRjlNbEUzb0g2dUNVMTduRVlSYWNKakdH?=
 =?utf-8?B?UTJ6SWxZN2VHZ1B1Vkh5Z0trTmpGZVdxVEZCS21LY1ZLeG5aY2tBekV4alRu?=
 =?utf-8?B?aDFnemFNRWdXSm4xMHNRSWxYa0lBWGhySzdzcFJaVVZvUFByK1MrYnJVZVNT?=
 =?utf-8?B?MWdDQkRJL1NTa1pMRFhGL1RyMm54QjF1WSttYTlXWEhDOXphMUUydEdJRVhl?=
 =?utf-8?B?akp1RW9sdE84VERRRUhmelN5alRTSExmRVd2ZHlOeGpXdmw4QlQxZ0dtSjUy?=
 =?utf-8?B?SEozSTB6aFY0OGs4RHppVHZCY0wxamZIdTlVd1EzN0xJUS9ZczlLUEVMczlv?=
 =?utf-8?B?cG41T1NEUk83N1JuSDhPTzJybllPV2s1R0hDVFNqa2loVUZhWWhLdnkxclhP?=
 =?utf-8?B?TzZxTlM1Q2dBSHVmVWhNdmI2WFVNYmN2WGp6TFpTSkJSRFJVcGg2WWFEbmx2?=
 =?utf-8?B?OFV3TXV3R0IyZHFMbUZpck5ybDE4Tnd4WXE5TyswVzBSQXlkK1dHUHJ3WUFx?=
 =?utf-8?B?VUhObklkRkNHSFMycWtTNFpTa1JGdU9tM3JKZDYzbHluQ0hrdlRJNExIaG5Z?=
 =?utf-8?B?bkp0MnFSWnI1TExGeEtyV3djdDdLMTVPNlhsUnJVWE9CM25DS3ZwLzI3aWVO?=
 =?utf-8?B?L0U2ZVU3VWt0M2dIK3JmRVpLQkdBbHVXRFpwdGQxMnJ1Y0xOV2czVFBYL2tX?=
 =?utf-8?B?VmliUVY1YkpSNHFid3ZJZXltZmhIaWEyTURVcFNDcnhDeXBTeVY5UEVWV1ZC?=
 =?utf-8?B?VW9LWHByN0s4WjQ1a0dTN0QrQmJ5bnlyelVTNU40NHpBbnV4MmhYQnNpcVM3?=
 =?utf-8?B?bGV3TEdwVDRHRFZaSHl0UUdpSUIzeWVHMCtnS2ZLVnhZa3IwM1lpczZBSjZ6?=
 =?utf-8?B?NUs2c01tSzZRVlBKcktWNkM0MElHdlRNVSt5T1Y2QyttMDhKMkxGTEtFUlJ3?=
 =?utf-8?B?QzAySHd1Q2JHU1QrRUxuaWZrYVdZSXhjcGlmY2wwcFRMNjRxSGpHNFM5ek5K?=
 =?utf-8?Q?YYRRdpSX5Afdmx4ujt8cl6XleI5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1kUjVJT2E4Vy90bWpNMHUzSlcyallkaWxhOGV0SkkwQ2NZQVpVMkxsNjZk?=
 =?utf-8?B?N2FtNnNaSG9zcU5sK0Q0cmZSOEVVWkhMU2NKZ25iWEprRm1WYm9vd05MZ0pR?=
 =?utf-8?B?c2dxUlZVbDdMUkNNNHJHVFk3TVNzMk84cEtQb2VEdGlseG1rWjV4NlEwZ1Y0?=
 =?utf-8?B?d2dpVDBwTDE5ZDhYOEVLeGZ0QzdCQWlUYmE2eDBPN2ZKdUQxMndvc3pMSlQ0?=
 =?utf-8?B?eVRlTU8yYk9tUUg2QlovV3V6WWlKWVlURHpYc1hnaUdNZ0FRVytqZ2FPNDI5?=
 =?utf-8?B?UG1ZT2pZMDVsdG03dDZUeDJTS1psVEg3ckdkWXVlZkJXL1ZQT3c5Rm5mVDNW?=
 =?utf-8?B?bUdDNDhTb09BNlpjQ3M2ODdJUTFNWWg3MHRXSU96NmMxRXV4eHI3UTB0MXJq?=
 =?utf-8?B?clV3SjhOaDdTYkcyTHJxaGVIQUJob2hBaGFpaS9zclgvTGlOcGZkQ2NGQ3gy?=
 =?utf-8?B?MGZ2am5GSzZOODFwbGZKNjVOZ2V4ZXp5c21HRG1zeVI2Q0V0ejRYUG5UY1Fu?=
 =?utf-8?B?amcrMEp6RkdzR1BZL2cxeEZTZXFySGZYcU9XZzRBa0pQaVpNdjVTbG9TWHZj?=
 =?utf-8?B?eWNtbTg5VTc0OXl3RzFsNnVGNGpqOXpIeU5pVHg4aFZqdWwzajI5REpOeG9a?=
 =?utf-8?B?cndLSHE3QTIrV2RDd1JoSHU2cmpSYWtMN3Fod2pmemRWVGs5bFQ5R25iWWRv?=
 =?utf-8?B?S1BYdEZzOElFTmhzNENaTUNtMm9VOWxrTVNqRW1GSlpxT1J6eWErMnJYVWg2?=
 =?utf-8?B?eXgyT2h0VHpLb2JscTFJMVZXeUFsc04zbkhML05XYlFmUzNNUHA0MnFRbjV6?=
 =?utf-8?B?dEhnQmN3THM3Rm5ETGJNNDZvbnYxSCs2dG1pR29sUzVTbTBoRkRzZG5uVTRo?=
 =?utf-8?B?V1VIZE04UjJYUlN5aWxzY3hHazVpcWRXUHBNY1FRZm1wMTRvNFdReko3Tmps?=
 =?utf-8?B?dTNyNkxrUEVsRmErTmRuWU1abGUxc0RmcWlSOFJRR05XUm9EZzBvOUM4ZTZ6?=
 =?utf-8?B?YkRsWHFQZFVtbXMwbUFyTHBnMDJaeHJQdDgwc1pVdnFmRTM4Y3hDd1ozTVZH?=
 =?utf-8?B?d09Cd1ljVTFqSlFvcmY0a0VuWFdBWWNBbm1mblcxcGtidk80Qy9YUVlRaDJW?=
 =?utf-8?B?RStWT0VYQzF2NHY1RjQ2Z21OSHFBd3RXcDdZZG9hRE53MXFSWEFNQ2lPYVI0?=
 =?utf-8?B?VE9teWJRQ0YwRnQxNzhmdzY5Y0tLanR2MVhaYUQ4Zi83TW0xUTdybVNEWWlV?=
 =?utf-8?B?MmI5S0djd3BZWW50WE1iNUczV1ZITVArSGxKOW1ncER3cHVWUU8wbHY2U0RN?=
 =?utf-8?B?UDgvZTBIcldzckZjRkcrSCtRRWI0ZS9FaVdwa2tOeWJ3TUVUUDJId2h3Skxk?=
 =?utf-8?B?NGl1SUZZVFh3M1BCcUsxS3hseUN0K0NTbXAzNVhxaG1pZzF0NUxIWkxUMDI1?=
 =?utf-8?B?VDA5RjhhVzJiY0l4OGhSM2Jsalg2ZTBjSmJCM0c2WWVVRjdkV1JrYjhhdUJm?=
 =?utf-8?B?NWFiMXVnUnZteG5qVm5iVzBFN1pFaEZnSURTRmJHbkMzNnJqcnMxZFlWcVRO?=
 =?utf-8?B?Z3ArdzVxZHVHK0tudCtGMlVDalBQbEZna052Z3ZpUDVnS25PRkNJMG1jTUcx?=
 =?utf-8?B?eUhsanU0TVY4bmhxL2k4aGx2NlBmNHV0d2Y2VndETjhPMFFobXVuTG85Umd5?=
 =?utf-8?B?QnFjREdMb3hlQXBTRDdHakZRbldLRXhucXFWQjEzUXZ3NmF0YUJydC9JeWxn?=
 =?utf-8?B?bWxCeEYyVGtnUXpyMmxWNlhqK0JjaDJhK29xRGg0S3BFVWtZakZjOG9jb1JF?=
 =?utf-8?B?YjQ1dzBPdHBVRG9EM3dIdW93WjRLajY1d0MxZXdsY2NFdzFseW50eVdQRGVz?=
 =?utf-8?B?bEhDbHFiMFQrbzJMNjdPbjNPdzdnZUhjOFlrZ2l2Y3ZZeHl5ZlpURVN0TGtK?=
 =?utf-8?Q?YjsK5QioiTXZY128Fb3WvwCiLpFVjRHc?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b4711c-2cc0-4126-73e2-08df4a8b8bb0
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9189.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 00:32:11.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5532

Add KUnit tests for a probe response that carries a Multiple BSSID
element and is grouped with a hidden-SSID beacon entry, with the
beacon received both before and after the probe response:

 - once all entries are unlinked, only the reference returned to the
   caller may remain on the beacon entry;

 - while a reference to the nontransmitted BSS is held, the
   transmitting BSS and the beacon entry it points to must stay alive,
   each with exactly one reference.

Without the previous patch the first test fails in both orders.

An AI coding assistant was used to write these tests.

Signed-off-by: MariusVanDerWijden <m.vanderwijden@live.de>
---
 net/wireless/tests/scan.c | 132 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/net/wireless/tests/scan.c b/net/wireless/tests/scan.c
index 8c20278b5d3a..7ae599f17390 100644
--- a/net/wireless/tests/scan.c
+++ b/net/wireless/tests/scan.c
@@ -520,6 +520,135 @@ static void test_get_bss_miss_reason(struct kunit *test)
 	cfg80211_put_bss(wiphy, bss);
 }
 
+static const u8 mbssid_hidden_beacon_ies[] = {
+	WLAN_EID_SSID, 0,
+};
+
+static const u8 mbssid_hidden_presp_ies[] = {
+	WLAN_EID_SSID, 4, 'T', 'E', 'S', 'T',
+	WLAN_EID_MULTIPLE_BSSID, 15,
+		2,				/* MaxBSSID Indicator */
+		0, 12,				/* Nontransmitted BSSID Profile */
+			WLAN_EID_NON_TX_BSSID_CAP, 2, 0x01, 0x00,
+			WLAN_EID_SSID, 3, 'N', 'T', 'X',
+			WLAN_EID_MULTI_BSSID_IDX, 1, 1,
+};
+
+static const struct mbssid_hidden_case {
+	const char *desc;
+	bool beacon_first;
+} mbssid_hidden_cases[] = {
+	{ .desc = "beacon_first", .beacon_first = true, },
+	{ .desc = "presp_first", .beacon_first = false, },
+};
+KUNIT_ARRAY_PARAM_DESC(mbssid_hidden, mbssid_hidden_cases, desc)
+
+/*
+ * Inform a hidden-SSID beacon and a probe response for the same BSSID that
+ * carries a Multiple BSSID element, in the order given by the test
+ * parameter, so that the probe response entry is grouped with the beacon
+ * entry and is the transmitting BSS of one nontransmitted BSS.
+ */
+static void mbssid_hidden_setup(struct kunit *test, struct wiphy *wiphy,
+				struct cfg80211_inform_bss *inform_bss,
+				struct cfg80211_bss **beacon,
+				struct cfg80211_bss **trans)
+{
+	const struct mbssid_hidden_case *params = test->param_value;
+	const u8 bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x60 };
+	int i;
+
+	wiphy->support_mbssid = true;
+
+	inform_bss->chan = ieee80211_get_channel_khz(wiphy, MHZ_TO_KHZ(2412));
+	KUNIT_ASSERT_NOT_NULL(test, inform_bss->chan);
+
+	for (i = 0; i < 2; i++) {
+		if (i == 0 ? params->beacon_first : !params->beacon_first) {
+			*beacon = cfg80211_inform_bss_data(wiphy, inform_bss,
+							   CFG80211_BSS_FTYPE_BEACON,
+							   bssid, 0, 0x1234, 100,
+							   mbssid_hidden_beacon_ies,
+							   sizeof(mbssid_hidden_beacon_ies),
+							   GFP_KERNEL);
+			KUNIT_ASSERT_NOT_NULL(test, *beacon);
+		} else {
+			*trans = cfg80211_inform_bss_data(wiphy, inform_bss,
+							  CFG80211_BSS_FTYPE_PRESP,
+							  bssid, 0, 0x1234, 100,
+							  mbssid_hidden_presp_ies,
+							  sizeof(mbssid_hidden_presp_ies),
+							  GFP_KERNEL);
+			KUNIT_ASSERT_NOT_NULL(test, *trans);
+		}
+	}
+
+	KUNIT_ASSERT_PTR_EQ(test, (*trans)->hidden_beacon_bss, *beacon);
+	KUNIT_ASSERT_FALSE(test, list_empty(&(*trans)->nontrans_list));
+}
+
+static void test_inform_bss_mbssid_hidden(struct kunit *test)
+{
+	struct inform_bss ctx = {
+		.test = test,
+	};
+	struct wiphy *wiphy = T_WIPHY(test, ctx);
+	struct cfg80211_inform_bss inform_bss = {
+		.signal = 50,
+		.drv_data = &ctx,
+	};
+	struct cfg80211_bss *beacon, *trans;
+
+	mbssid_hidden_setup(test, wiphy, &inform_bss, &beacon, &trans);
+
+	/* drop the transmitting BSS together with its nontransmitted BSS */
+	cfg80211_unlink_bss(wiphy, trans);
+	cfg80211_put_bss(wiphy, trans);
+	cfg80211_unlink_bss(wiphy, beacon);
+
+	/* only the reference returned to us is left */
+	KUNIT_EXPECT_EQ(test, bss_from_pub(beacon)->refcount, 1);
+	cfg80211_put_bss(wiphy, beacon);
+}
+
+static void test_inform_bss_mbssid_hidden_held_nontx(struct kunit *test)
+{
+	struct inform_bss ctx = {
+		.test = test,
+	};
+	struct wiphy *wiphy = T_WIPHY(test, ctx);
+	struct cfg80211_inform_bss inform_bss = {
+		.signal = 50,
+		.drv_data = &ctx,
+	};
+	struct cfg80211_bss *beacon, *trans, *nontx;
+
+	mbssid_hidden_setup(test, wiphy, &inform_bss, &beacon, &trans);
+
+	nontx = list_first_entry(&trans->nontrans_list, struct cfg80211_bss,
+				 nontrans_list);
+	cfg80211_ref_bss(wiphy, nontx);
+
+	/* drop everything except our reference to the nontransmitted BSS */
+	cfg80211_unlink_bss(wiphy, trans);
+	cfg80211_put_bss(wiphy, trans);
+	cfg80211_unlink_bss(wiphy, beacon);
+	cfg80211_put_bss(wiphy, beacon);
+
+	/*
+	 * The nontransmitted BSS keeps the transmitting BSS alive, and that
+	 * keeps the beacon entry it points to alive, each by exactly one
+	 * reference.
+	 */
+	KUNIT_ASSERT_PTR_EQ(test, nontx->transmitted_bss, trans);
+	KUNIT_ASSERT_PTR_EQ(test, trans->hidden_beacon_bss, beacon);
+	KUNIT_EXPECT_EQ(test, bss_from_pub(nontx)->refcount, 1);
+	KUNIT_EXPECT_EQ(test, bss_from_pub(trans)->refcount, 1);
+	KUNIT_EXPECT_EQ(test, bss_from_pub(beacon)->refcount, 1);
+
+	cfg80211_put_bss(wiphy, nontx);
+}
+
 static struct inform_bss_ml_sta_case {
 	const char *desc;
 	int mld_id;
@@ -975,6 +1104,9 @@ static struct kunit_case inform_bss_test_cases[] = {
 	KUNIT_CASE(test_inform_bss_ssid_only),
 	KUNIT_CASE(test_get_bss_miss_reason),
 	KUNIT_CASE_PARAM(test_inform_bss_ml_sta, inform_bss_ml_sta_gen_params),
+	KUNIT_CASE_PARAM(test_inform_bss_mbssid_hidden, mbssid_hidden_gen_params),
+	KUNIT_CASE_PARAM(test_inform_bss_mbssid_hidden_held_nontx,
+			 mbssid_hidden_gen_params),
 	{}
 };
 
-- 
2.56.0



On 11/25/26 1:23 AM, m.vanderwijden@live.de wrote:
> BSS entries point to other entries through hidden_beacon_bss (a probe
> response entry to the hidden-SSID beacon entry it is grouped with) and
> transmitted_bss (a nontransmitted BSS to its transmitting BSS). Each
> get or put on an entry is also applied to the entries it points to,
> one level deep, so that those stay alive while it is in use.
> 
> With multi-BSSID these links can be chained: a nontransmitted BSS
> points to its transmitting BSS, which can itself be a probe response
> entry grouped with a hidden-SSID beacon entry. One level of
> propagation doesn't cover that, and the two places that create such a
> chain count it inconsistently:
> 
>  - __cfg80211_bss_update() takes the reference for a new
>    nontransmitted BSS with bss_ref_get() on the transmitting BSS,
>    which also increments the beacon entry, but putting the new entry
>    only decrements the transmitting BSS.
> 
>  - cfg80211_combine_bsses() adds the whole refcount of a probe
>    response entry to the beacon entry it is grouped with. If the probe
>    response entry already has nontransmitted BSSes, that count
>    includes the references they propagated to it, which they later
>    drop only on the probe response entry.
> 
> Either way the beacon entry keeps a reference that is never dropped,
> and once it expires it is never freed. A station scanning near an AP
> that hides its SSID in beacons but sends a Multiple BSSID element in
> probe responses leaks such an entry each time it expires; spoofed
> frames can repeat this.
> 
> Taking a single reference in the first case would stop that leak, but
> then the beacon entry can be freed while the transmitting BSS, kept
> alive by a nontransmitted BSS that is still in use, points to it and
> shares its beacon IEs.
> 
> Instead, give each entry exactly one reference on each entry it points
> to, and drop it only when the pointing entry is freed. Getting or
> putting an entry then no longer touches other entries, chains of any
> length are covered, and an entry can't be freed while another entry
> still points to it. Freeing an entry can now free the entries it
> points to in turn, so do that iteratively rather than recursively.
> 
> The leak was found with a userspace fuzz harness around
> cfg80211_inform_bss_*() whose oracle checks BSS refcounts against the
> table's links. An AI coding assistant was used to analyse the
> finding and to draft this patch and changelog.
> 
> Fixes: a3584f56de1c ("cfg80211: Properly track transmitting and non-transmitting BSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: MariusVanDerWijden <m.vanderwijden@live.de>
> ---
> Notes (not part of the commit message):
> 
> - Testing: KUnit on ARCH=um (all cfg80211 suites), with the tests from
>   patch 2/2, on master 8d7fe9885c62:
> 
>                          leak test         leak test        held nontx
>                          beacon first      presp first      BSS test
>     master               refcount 2        refcount 2       pass
>     this patch           pass              pass             pass
> 
>   With this patch all 61 cfg80211 KUnit tests pass, with and without
>   CONFIG_KASAN=y, and KASAN reports nothing. Not tested on hardware or
>   with mac80211_hwsim.
> 
> - Since get and put no longer follow links, entries that pointed to
>   each other in a cycle would simply never be freed rather than cause
>   a loop. I haven't checked whether received frames can create such a
>   cycle.
> 
>  net/wireless/scan.c | 76 ++++++++++++++++++++++++---------------------
>  1 file changed, 41 insertions(+), 35 deletions(-)
> 
> diff --git a/net/wireless/scan.c b/net/wireless/scan.c
> index 1c50a16c0e9b..0a978f5d4a10 100644
> --- a/net/wireless/scan.c
> +++ b/net/wireless/scan.c
> @@ -44,13 +44,13 @@
>   * beacon's information.
>   *
>   * Reference counting is done for all these references except for
> - * the hidden_list, so that a beacon BSS struct that is otherwise
> - * not referenced has one reference for being on the bss_list and
> - * one for each probe response entry that points to it using the
> - * hidden_beacon_bss pointer. When a BSS struct that has such a
> - * pointer is get/put, the refcount update is also propagated to
> - * the referenced struct, this ensure that it cannot get removed
> - * while somebody is using the probe response version.
> + * the hidden_list, so that a BSS struct that is otherwise not
> + * referenced has one reference for being on the bss_list and one
> + * for each entry that points to it using the hidden_beacon_bss or
> + * transmitted_bss pointer. Those references are only dropped when
> + * the pointing entry is freed, which ensures that a referenced
> + * struct cannot get removed while any entry pointing to it, e.g.
> + * the probe response version, still exists.
>   *
>   * Note that the hidden_beacon_bss pointer never changes, due to
>   * the reference counting. Therefore, no locking is needed for
> @@ -107,40 +107,47 @@ static inline void bss_ref_get(struct cfg80211_registered_device *rdev,
>  	lockdep_assert_held(&rdev->bss_lock);
>  
>  	bss->refcount++;
> -
> -	if (bss->pub.hidden_beacon_bss)
> -		bss_from_pub(bss->pub.hidden_beacon_bss)->refcount++;
> -
> -	if (bss->pub.transmitted_bss)
> -		bss_from_pub(bss->pub.transmitted_bss)->refcount++;
>  }
>  
> -static inline void bss_ref_put(struct cfg80211_registered_device *rdev,
> -			       struct cfg80211_internal_bss *bss)
> +static void bss_put_link(struct cfg80211_bss *pub, struct list_head *free_list)
>  {
> -	lockdep_assert_held(&rdev->bss_lock);
> +	struct cfg80211_internal_bss *bss;
>  
> -	if (bss->pub.hidden_beacon_bss) {
> -		struct cfg80211_internal_bss *hbss;
> +	if (!pub)
> +		return;
>  
> -		hbss = bss_from_pub(bss->pub.hidden_beacon_bss);
> -		hbss->refcount--;
> -		if (hbss->refcount == 0)
> -			bss_free(hbss);
> -	}
> +	bss = bss_from_pub(pub);
> +	if (--bss->refcount == 0)
> +		list_add_tail(&bss->list, free_list);
> +}
>  
> -	if (bss->pub.transmitted_bss) {
> -		struct cfg80211_internal_bss *tbss;
> +static void bss_ref_put(struct cfg80211_registered_device *rdev,
> +			struct cfg80211_internal_bss *bss)
> +{
> +	LIST_HEAD(free_list);
>  
> -		tbss = bss_from_pub(bss->pub.transmitted_bss);
> -		tbss->refcount--;
> -		if (tbss->refcount == 0)
> -			bss_free(tbss);
> -	}
> +	lockdep_assert_held(&rdev->bss_lock);
> +
> +	if (--bss->refcount)
> +		return;
>  
> -	bss->refcount--;
> -	if (bss->refcount == 0)
> +	/*
> +	 * Freeing an entry drops the references it holds on the entries
> +	 * it points to, which may free those in turn. Use the list member
> +	 * to do this without recursion: an entry whose last reference is
> +	 * gone is no longer on the bss_list, other than when the whole
> +	 * list is torn down in cfg80211_dev_free(), and an entry still on
> +	 * the bss_list always holds its own reference for being there.
> +	 */
> +	list_add_tail(&bss->list, &free_list);
> +	while (!list_empty(&free_list)) {
> +		bss = list_first_entry(&free_list, struct cfg80211_internal_bss,
> +				       list);
> +		list_del(&bss->list);
> +		bss_put_link(bss->pub.hidden_beacon_bss, &free_list);
> +		bss_put_link(bss->pub.transmitted_bss, &free_list);
>  		bss_free(bss);
> +	}
>  }
>  
>  static bool __cfg80211_unlink_bss(struct cfg80211_registered_device *rdev,
> @@ -1855,7 +1862,7 @@ static bool cfg80211_combine_bsses(struct cfg80211_registered_device *rdev,
>  		/* combine them */
>  		list_add(&bss->hidden_list, &new->hidden_list);
>  		bss->pub.hidden_beacon_bss = &new->pub;
> -		new->refcount += bss->refcount;
> +		new->refcount++;
>  		rcu_assign_pointer(bss->pub.beacon_ies,
>  				   new->pub.beacon_ies);
>  	}
> @@ -2118,10 +2125,9 @@ __cfg80211_bss_update(struct cfg80211_registered_device *rdev,
>  			return NULL;
>  		}
>  
> -		/* This must be before the call to bss_ref_get */
>  		if (tmp->pub.transmitted_bss) {
>  			new->pub.transmitted_bss = tmp->pub.transmitted_bss;
> -			bss_ref_get(rdev, bss_from_pub(tmp->pub.transmitted_bss));
> +			bss_from_pub(tmp->pub.transmitted_bss)->refcount++;
>  		}
>  
>  		cfg80211_insert_bss(rdev, new);

-- 
Marius van der Wijden

https://github.com/MariusVanDerWijden

