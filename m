Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.35.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795566275;
	b=HdOjiOPnz6fBcNF+3tIIpkQ7KN+EOTodyZYat5sUmTkAJlUU6KFwFw3WbZoET5m7LZg9
	 8mv3aPzLJXRuwmGvygW+fA5oz6Kyn9GNJ0a0liGTAzhrzVyotcExT1FHRVspWaNs3//B1
	 SM0KSyrJdAiuILwh+0IKU7DOwb8ytfvjQT+v5I96u6G6SJ87gQjHYQ2WLmapSqCfoQuzw
	 haqCjaLV/4zJQDeneC0F1vulBBa3DnhSA+8PLJ86F7IAdkbaS1QX3z8wEtxbbgQIlLIr8
	 D2Tr9GIgMTH1IE/lvHlpxQyx72FzEPUtNja+hrUSWJLa5WPTRtlwRfbCCBPUafgdqig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566275;
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
	b=BM9zcs9GDk4XxZMBvTMhF1TXZnx3hSM4MYQoQXcphVG2+wtJJl50ybMAWOEq5tXjFUSa
	 0QCsrwmm6uo/bip81LLDI4JYfjbVEsKQ5giA9yPXXyiTh6mdJSC3u9Ucw6OA8kF37Bit1
	 ITD5sBh+a62/T2D9TifCVaquJ7jdJCnvQKP1l5KCZci0zUStpckxA8e9QSnt8viIiLWuB
	 KnNKtSgAcwERQBlwjrUIH886LN7V4W/AHh74Iw0RcSXkrFokhn47FWxV5WoV3GR2kWeNC
	 75G77iJkQBH/SDQap9KBAyf2qyjkdGYRVV2Vm7AV5DyaqmReIiiaFHPLx/ZFMjhQFjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=NqrhXxzg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.35.76
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013076.outbound.protection.outlook.com [52.103.35.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A957606A31E
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A957606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=NqrhXxzg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuLgPHKJoAyvBmrmx7ggqOGJzliJKFN29wFBDYVwmgodRtcqCyRcniAjycCg/Z+NdI6lPD68SQ+5MztqEjLWnix33+03CGaUMDm1bEXYTi7SugxAyx1gczQR1anibZeVP0nMt8yk+T2jklv+qN512/AvR/NwIqxqhvvh5ZGSBtZUvVct55a7sdExvq4TuWzaKHo43RLZ+HylSuQHjFdSi1IHpLr7n/AmiPjKHPQugxzT4jipq/8goaq5fOWo5AkazjiItXpXXUqxjkW4XpEeWdLm+k88dYn7Fx/V6a5JpJHcH/Lx6G0xtrha4gQseRijztFGn8HdM4hRtecqhvRpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9HConLyeW7zy2y4ljB9fC1EvY06xLs6Gj1jQpB5qmI=;
 b=Cu5Y9j661hEX45jLQetdPfNmGZtxInwJlWlUVanlmE2Zlf+bRAtYB2oSz1U/n1V7DNY2TCj6Z3FNhEUjP1w97MG7F8rDMbaMNTmJ4weSKpgPP0/Qbq6hqIbcISP4Ht6JQrOyx1Khj0TnJgQDD4IYEnVKWxAeJ+6W8/ha5a4sBDrCrbKU6Z4I+NyX0NlSr+l+Vm2LcYmw07zXo5fM5+CYJI8cvh/jsg6UTHS+nxsP+PMyuNbuvvZ+Ad27tGQ1whZ/G4h28jOD0XLUAV+Y5BzOsVCejAJnR44sjyOZliJNXqTkyAbrrOwlIhUU99WjjqPGdZbGbCf+y/uWCU7+hHOEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9HConLyeW7zy2y4ljB9fC1EvY06xLs6Gj1jQpB5qmI=;
 b=NqrhXxzgJGZYxdd2qTxTVNw5Ndq7gIrPlCGNJ3tDpFHsosFPPJG1qyN6wUUemtNYnphp+xftbGfdDsNy2Es3Niu0z+H97VGTGJ4HBtRQCo8dnZBgiUW54srvmWq0qNDGLWrIRP4C6DQFqdki3/CqDKzOSQJ4OBfI4BXwasskwwDODMjIQyCQI7lwNfjBwERfThofh5U1Ez9YpqVC7kAyHB9Q2NW6iK7rinXBjdYYpyRkG3UESEcLQMkmf1ABC/T+7qxZCvXXCwR/6dev5RGix5xOexLa6AGP0POBu+rUOG7QpUpwing0X8E2U0JgS1REUiYjWNXHngZSzvNcbbhXZA==
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com (2603:10a6:10:3fe::21)
 by DBBPR08MB6089.eurprd08.prod.outlook.com (2603:10a6:10:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 00:24:29 +0000
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420]) by DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 00:24:28 +0000
Message-ID:
 <DB4PR08MB918919D2F58C8A6E575AF1E191432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 01:24:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless 1/2] wifi: cfg80211: fix BSS reference leaks
 with, hidden SSID and MBSSID
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, sara.sharon@intel.com
References: <04a86b1e-2362-4b50-9e34-fbc3b6f70c97@live.de>
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
In-Reply-To: <04a86b1e-2362-4b50-9e34-fbc3b6f70c97@live.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0402.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::14) To DB4PR08MB9189.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::21)
X-Microsoft-Original-Message-ID:
 <9e16ccf4-dbfc-4ddb-834b-47b6519e656d@live.de>
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
X-MS-TrafficTypeDiagnostic: DB4PR08MB9189:EE_|DBBPR08MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: a69f396f-85fb-481a-3586-08df4a8a77d0
X-MS-Exchange-SLBlob-MailProps:
	+bEufbke4JdvqmTQng7ItjpfaCLJSA3uqAKkIepCfxbIe8al84n32pAl8oG+Isn6NlRHD2nwpZec3aYOctmwOWA+0A6dJU1RC/pANvorWym3mrX5y4MOzCo4YP+1MIjQ9jyR8PmE/z8Ns4/ctFamNnQY0vjNCa2NgQqbMyRhMkPd0Cr+nTOMw+zHKuGtEu0lwQ2n9jlUFlJ+Nm+jDSxNTQyo9WHxOT7+dnV/RsLAECIJVjXy6ZAcunZ4a7/r0eDPgnypgGbqvwIA+1KnCaZiICh6ZOjQXjFTmKxoM4on5UyJzGRTrInNXfssbjSTfvYSr4bQ3qn5q1rFACT/DLa8eaWM4T3tNjM4gahauyc8NiUerT+r2uVFsoWEN70DQsLFkwK7x9RRyBNmm/c2STrsNUqZrokVEZahIQvI22w6LngU3uDWCk3PVhZGPmnVdDv8jBuAK9KyBJqv93wF2LAVBMj4fpxTwXDuk5D0mUT9qfdb9HRZ4fF5HIQv52Lv6ZhGldWuq7NZ/53F6f07YaUEiYpzNpLTKrNkRyhOdJ9h69yic5iJglOkbIA6VcD1xVu03nphSAuHa9SlTgy52cNrPZQ4prFCR/zhzYW10m8x1YlNcoO7ogOHOswx8gWYskEhGPKrS19ISZknAciLDQDmf39bgWqR9QvaRXbDZv/Ng6lJt4GVRG+p/tyN+usqwdwhgLVFYZRoLBVF17+mChQEH2uNU6gT+PAdxgO6/iq8ATZcdjfGuBPGe5c4eZKpFAGHmL5fI8dlXnCacBPMxrVJ1A==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|8060799015|41001999006|19110799012|23021999003|25031999004|6090799003|55001999006|24021099003|51005399006|25010399006|440099028|3412199025|12091999003|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkxMY1Fna0hJT1dHRDNQeUl0NFA5TXZURnBTS2t1SmdSUlJrUlhGZ3hHRjBa?=
 =?utf-8?B?N3pKMmJxRTArNUUzWmJCVkFCbWdZME0xbFc5ZUdWeHQxL01QdnpuUjJEdW54?=
 =?utf-8?B?K3dhU20vN09Cc2pWeWQ4UVJsd2t5UUVoYVFWTHRkb3QxWEN2S0lacmhpU3dm?=
 =?utf-8?B?L2RqN3lJYXpGaXUyQjVVTGNPaXNpMTd3ZWhLNmVTTjRCU00rK0dKUi9jVW1O?=
 =?utf-8?B?WGhoeGo2VHRrK1FWcGhTZkl6akEwSTUvMHFLZEJwMk1ER2NFOCthTUwwRkZK?=
 =?utf-8?B?NkVrbExZSXFUanR2TmJidmdxUjRQVitwck13bXdXVDgweUhNVlhyYW9DTURB?=
 =?utf-8?B?Y0p1cnFKTXp5TnFPY2dTcUlZS2pWa2VoTVVWd1ZDeDc3TFg0OC9BL2RsWXZM?=
 =?utf-8?B?aE9CVnl4alIzZlZtNzJ2aFdPTW5GQzdvYU1KbHlGY3YxTHdweHhLSEQ2Rlo3?=
 =?utf-8?B?WFpVcWlqS2tWOUQ2SDBOKzBYVHgyNnFNYU5XT1J6U3J6b1NxWFFRWjI0NUVz?=
 =?utf-8?B?SWJzNWdjWUV2Q1dwQ0hxYUdhbTRGLzNPRjJEOEFOaUkyb3JHY2JXWmdTV0lz?=
 =?utf-8?B?ckhqNGRBczBHNnpVekthZTY2bVQ2eXIvTWgwVHk1WEs0VUFiTDJtMnY2QlNO?=
 =?utf-8?B?MGRzMWhDa2lLczlEZnpRZkIzZ2owWE5TWC9CWTRlT1RaUzJJa0ZzTUhWay9H?=
 =?utf-8?B?NWoyd2VQRTNlclMrMmFvM016ZnlQcU1wdktOTUtsa2lBVllLUVBhV1ErdXky?=
 =?utf-8?B?TWp3S2plK1pCZDcvYmtPbS9HV3NBdnAvQkxLbmZSOVZ5TUNLUVRmN0xFcHlo?=
 =?utf-8?B?eXNEYTk1Vk0rVjBPb2VvU0xqbktjeG4yWFBTZ2xkWHJLL1k4eWFMcllBeXV0?=
 =?utf-8?B?RTFjclM5ODZOL2tPQWd0LzNGWVFlSlMrZzhqbGhEamRWOTZPZklnT3h1L0Rv?=
 =?utf-8?B?cGJQZUxCcm5GaWxqMDlML3dzY2pFWCtueHA5TElmdEt4Y0xobGhKamxpLzVw?=
 =?utf-8?B?Uk1VcFE0Ym9ZQWFjaVgvcGg5Rm10TSt1d1F0a1hGalVNWW5vSVNFc1h3NlZQ?=
 =?utf-8?B?K0pPMVJQb2c3K1BXYndUOGNUNUZlbm9hemR1Z2NJWXFpMkhlNENhNU05VkJD?=
 =?utf-8?B?R2NBeFNBRGsyT3Q4UForZDBQMTl3cWsrLytvVis2R3hYUUlnRVVBVTFkSFlE?=
 =?utf-8?B?S2o5VGx5YUc2TmttbkhiZnlwOXJka1lXOXEzdW14MGNSRkVzcVdxK0JZODZ3?=
 =?utf-8?B?L0htOCtyeUtKOC9Sd2tPZjRtTHg1UE5wZzVWQVQyb1NrRDZiN1hBK0ExL0Fs?=
 =?utf-8?B?T1k1TGlMaG1ZR2s1RGlvMzJjcHNheWV4VzFIdUptUWxrd1c5RHFpWEdHVE1n?=
 =?utf-8?B?a2lNbSttZDg0ZHlCWXpxU281MXdOWTJncHpIVldORlZ2aitsODJmNC9CWEdD?=
 =?utf-8?B?N2VNSzBvdURNWlIvbzFXbzFwTmVON3lzL0JDbmZIQzR4M3g5L0laV3NJT0o0?=
 =?utf-8?Q?RVb4175TlopuDTlSIvYmtShCJvm?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29NZDNyMVJqN0RCRkZsYmV5TFFtK3dVM2VEU3N1VWlZaVhGUG01UXYwWVRp?=
 =?utf-8?B?bS8raitvU3FITnZoVm1RNVBLYlFaTklVdHh0TUxEeUZEb21YanNFbGU0OGxS?=
 =?utf-8?B?bGdqOElvSm9QSWNzeW96ZXg5WVFLTXc2aVdLZFBkSGZmckhvLzh0SDVOb0w4?=
 =?utf-8?B?VEN4QTV4VVdVVzd2clFucEF2K3NjMFFGMG1rUWMyM2NUaVZ6TW9GWFNGZGN6?=
 =?utf-8?B?TDViWll3TDN1T3pRZWc4RVo1S3VlWXNOSGRnUmdmZzlVTFpnOHQ4SXNuMWk1?=
 =?utf-8?B?Smx6dWpZSWhlY0lZZlpYTzBmWElBTnQyQlVZUmsvcy9mbHR2c3Z4UTZHNG05?=
 =?utf-8?B?RWR2RlljdnJmZVZrdkNtQ29OYkdZSW9jTFVQRVNjejI5Z3ZpMnR1bDVUMHZi?=
 =?utf-8?B?WXpaWTZrNlJMMVczbFBaMEp1bXBFRTAwakNmYTNIc2wyN080RHNTMThXU0t6?=
 =?utf-8?B?N1U3d0NkZnlqZHV5L21JTnlZWUpDdkxkOFZnR2FKbE16OFkweWRJRThjWnhK?=
 =?utf-8?B?UHhhL0tkSUFVakN3dTZnTmVLRTk5M0ZXcmJTVTR0eVRXUTlTai96WXBPc0lh?=
 =?utf-8?B?YW5LUmJCU3ZoaXNuaHZLMzV0K05nT1BnVk4yS0tEUm5OLzlIcm9xdHVIVnpp?=
 =?utf-8?B?VXl0WExRaGh1Ynh3cXkwYWhrSHlFcUNVTlBBK2VCc1JKaDgyeTBSNzJEblBz?=
 =?utf-8?B?Z0RZcGt6cTFHRGJ5b2ZTc2p6RkNmOURQNk9ueXU3dkliaGF4c1RHZzFURVdm?=
 =?utf-8?B?ZVlMY1BUOXc1bXdwQ1ZmbEw4VzRXS0NPNlBFekpOZDBCYk9wU09GU1RkZ0Rl?=
 =?utf-8?B?NkFaK2J1UHI2cGhhUmNPYWI0enR3OEZNM1I1Qy9VaGpEZGlsYW5pNlYrYjlI?=
 =?utf-8?B?eVlRdjFQN0FiUlY0a3NLUjJpSlpwMDBHSUtXb2NRdWs3VlNuWVhGaVdObTRr?=
 =?utf-8?B?a2JmZGVlQ0UzSXcweUdpcnZkamFzRS9ET0c4SnA3eDJacWs2NFlzZHBWdkhy?=
 =?utf-8?B?RjF5K2hDTzZUdW90Wjh1UnBZU1VJZWIxVEtscFZVRy9BK2s5SUJhVkNLYkxx?=
 =?utf-8?B?U0tOUUc4NlZFR2pUOWJBY1Vkc0VLRVMrdWdkZ1FpSFJZUFM1TENMb0ZLRkRW?=
 =?utf-8?B?clhxcUhMbXdqa0VVanhJTHVtRWs5VVJlUi9JRWxOTVJHS3hCUW9BTmlZbDkx?=
 =?utf-8?B?ZExzaVRVYUxNU1A3bVphbzdZYVQwQUh6MGx3YktmYjdPSGtycVR0K0lwcEhx?=
 =?utf-8?B?ei9WbXY4VjlpZmY2NkRrUzd3QVFlbnJBMnREakRMaDZOMkNic2ErTWM3S1Fu?=
 =?utf-8?B?YzFvMWszekY3VkpFSGRUbzJpYXBBYXIvcUY5MXFqeWRIbGhkL1FoRmlQSktB?=
 =?utf-8?B?SjI5RnlzMzhtRTltM2VuSXNiVm5VbDJscnV2a2p1Wm5nb0VsUllWR05qL2Uz?=
 =?utf-8?B?RW1QQ2x3cTJvbEMxWWc0RVE3WkVNODBmYnpvdk0yMVM0UHdndmZ0enVycXdF?=
 =?utf-8?B?VkJ4T0xPSkxVSWhjeHRFY09ocW91dVl3a1UrS1IwTHdaZzZFV2ZtbHUyZW5n?=
 =?utf-8?B?RVB4Z0xSRUlEOEV3Z2c2R21yRVdiVklQVjdCVXhQNlo1ZmR6SmxBbUdhNDlR?=
 =?utf-8?B?NnVobys2UThWWXBsMWppZ1JmMUcwMzZmK054ZTlCMEptWEh1Y3hEK2sxTlRq?=
 =?utf-8?B?QnVkSFQ4TUVKVll1aVZkSGJVbUtHaTNaQys2TFk0Yk5oSU55djVJM0F4T09x?=
 =?utf-8?B?VkZHd1p4VGpkQ0VidzdGS25xVm90ZXd0MUtDbGdiWkpiWWJ6cUUrZ2pRSG5w?=
 =?utf-8?B?WlZaakwrcVhzbU13YjBxQ1AwZXVlTS8velFGUTFBeWhad0FtbmFuMzZUUHVs?=
 =?utf-8?B?cGZRU1JxWE5Db1F1SEJFRkxLYjJlUytCM1RCWDVwZ09BM2NGVTBJQ21abGgw?=
 =?utf-8?Q?x4K4YJWvaZG8hdm+06RxSRD8DYd65Sen?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a69f396f-85fb-481a-3586-08df4a8a77d0
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9189.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 00:24:28.8451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6089

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

