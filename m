Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795569345;
	b=lQLDNXrvuZkSAzctmVJ+g3DvmXjBmtrHE3f8YghHb4eWIg78GZ8NQQDe5Vnio16ZufU+
	 odZQaEWtmSdQInPGTiJa5yxaejV8JvMGdcEfsN+9xKbLUnu3MTLVCyDiO7+t1E2IDld/p
	 U0mD35NnzL5nrK2pF5FTQClCuNMo9TG+RaZ396fFH2A1R62uiqeO+nSH+73bBkGAPhMFG
	 2GaYNPrqy2QBGD5Wy05yLH6yxnfpLFC9QhZj9cNXxj+uZLk6IgkFNpr6d/uuGzLGCZMOE
	 AarEaOAOJX5QPFi0FJmHiy4rg74ioZ0V3yB8TgxFcLoUVgj+BpeySErafk8BwSeTvFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569345;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:Cc:From:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
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
	bh=wA7nki3zYgH3DY0B2UjQc4xo6/nsr83KtwA1PnWvzqI=;
	b=D1+bmhnDFQIQpAtjZOEgr/1VsV9J5mkMM8pqFf0phx1sPG2C2GaXZq3PVyk3+aBXuJw1
	 BNeQFPgTPoq1l6fNz5vsTwCf8RC7nZEreH1OcZs7ryTUweB12G0+pE0xzx8EEt8fzVqag
	 1Yg0sLcHOV00wCRWJqwX9cBOJwsD+0AxJtSx5zWcHdu3HyAouLz/AKI6hPm1ehnMMswZ6
	 s8OyrI/A9VuKGFIpDizcxcdxzuF8QiqSJjPjYXcXJF7pL8C9X3GZJENBZnXXbJM7D4kJH
	 0kniEn4Vy3mNj/+2/TB2IIfK5Zh5IBJu2tRYUzwbmKydBqXtNY1WloRuoCG3tSEju4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=WyHV22H1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.32.18
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010018.outbound.protection.outlook.com [52.103.32.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8D606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 01:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F8D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=WyHV22H1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb4ISHpWRLMxJc0B5GKQSN9XlSQSiI21LPpoqyTuaxbfX+pvIov9tt3uvPSaRLbd7HgsYbSh6h7LwGrBrzY3tazaEv7jKMUS3LDrHY6amyvXypsMC+P4tbyIG7fMM32apOWpaLYpxIwH9/z6B4RhQZBg9ux9JabxFe1QwpT9Lj4ekHSIxVJDPb1MtrhJp2RjoCL3h0gZNjiB9KWCp8Pq/fqiJGDEszfVF4f6brYWvwWqhE2bSjW2EJhgBJYIQ/K4tUKESOJcHYZwYm8vpuzuKrBZl/HFUmlwTtrKyrhcQ4fHQIX3tuBTrPd54O15ryZzSOFJ2bCglNsqASko/rmDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA7nki3zYgH3DY0B2UjQc4xo6/nsr83KtwA1PnWvzqI=;
 b=BUUal3HpcSDy57bTw+cGC2RB8GG35sMG2OCHq8hYrqmNLOumocUBq4ilcmfLKTywMZTpxd6eKdw+0ZjVcMgoWREKKVLS7kN56x0U/VZlsLhyznVJox1oHyzYWmfOESID1Sdt8eQTpW7K+VcJuA9TAhHoZYacLcIaEJrMqFMqP7AVIT19l70CPdfoGNZPCuMlLoYBMYkj406jh6+Q5Oj9IHhrsnGqp66MFUhP4Mf2CgWxbTRuxIRB7ymLHTzIIQbyWcf6iI3qNhaW8Pma4w9UbqVYefnLq/ohjElTHLHEuqe64Nlvd4+OYTANEZxpCuC5eVT8MZNy3/28ESHqSttDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA7nki3zYgH3DY0B2UjQc4xo6/nsr83KtwA1PnWvzqI=;
 b=WyHV22H19uiCICTdj0ANI3YWOiaB210q6YtS6OMHygGIaeg7AvGpI+9DIzv1w7pe64hQhHH6dVuGswOG8pr7TbUBAuoFk4tA/qRdbu7kTProofOWeZ6VpxFp5jFvl+5ldeDjwXwPHEJ5PphYKZzUXdvScePYXpzVVyQ2l3o2XaPhTAw9x7uxVFUZtHpyIYG/05hRhJurivsuh42rA4ecgCbyeIsJON32+Ow04NOf9duwRkJPDt2fbg+WCRcCFY4DgfoqwidgZXgm+72fl7X+729tW0PryCOexMpl3trCl34wqCG+iB6TfEWMuoJu1LpIvDukKoWPQlPeH0BIXjCqBg==
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com (2603:10a6:10:3fe::21)
 by AS8PR08MB6600.eurprd08.prod.outlook.com (2603:10a6:20b:33e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:15:43 +0000
Received: from DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420]) by DB4PR08MB9189.eurprd08.prod.outlook.com
 ([fe80::6079:7a17:a636:4420%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 01:15:43 +0000
Message-ID:
 <DB4PR08MB91891E93B7DB8C05BE17CF4291432@DB4PR08MB9189.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 02:15:40 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, benjamin.berg@intel.com,
 miriam.rachel.korenblit@intel.com, lachlan.hodges@morsemicro.com
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Subject: [PATCH wireless 1/2] wifi: cfg80211: only parse multi-link probe
 responses on MLO bands
Autocrypt: addr=m.vanderwijden@live.de; keydata=
 xjMEawIisRYJKwYBBAHaRw8BAQdAhSt8XBoKcVuzaN2I1VFbR8o03wLSBTtprzeKdDTLLmLN
 L20udmFuZGVyd2lqZGVuQGxpdmUuZGUgPG0udmFuZGVyd2lqZGVuQGxpdmUuZGU+wo8EExYI
 ADcWIQTMEyts92CDKwC/+p7K40LVK7aRSQUCawIisQUJBaOagAIbAwQLCQgHBRUICQoLBRYC
 AwEAAAoJEMrjQtUrtpFJIFUA/AkdYmKA15B26VPa6XNZInO25k1iDmlw9nGUfrMeq9IsAP9y
 JvMBlSzBrOsPOO3IUma8dXlqXvZVpl6W7D3KPAX5Cc44BGsCIrESCisGAQQBl1UBBQEBB0Dm
 fcqAiSmFwZxMqLGOinFMo7z03kaO/ksCvCiQK5p2NgMBCAfCfgQYFggAJhYhBMwTK2z3YIMr
 AL/6nsrjQtUrtpFJBQJrAiKxBQkFo5qAAhsMAAoJEMrjQtUrtpFJQn0BALNFi/S3m+kqFQqh
 fQg3VAWd3GzjgxGnIM8JoLG7RY/aAP9dRyTomx1sZDi1LJTRGqOfT2Kd5sU2iAPsEBA5wZfE Cg==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::19) To DB4PR08MB9189.eurprd08.prod.outlook.com
 (2603:10a6:10:3fe::21)
X-Microsoft-Original-Message-ID:
 <56a60324-85ab-4eb1-8f74-eda61b24c246@live.de>
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
X-MS-Office365-Filtering-Correlation-Id: c21049b8-cb8f-40af-200b-08df4a91a002
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|16041099003|19110799012|8060799015|25010399006|4140399003|24021099003|55001999006|25031999004|5072599009|5062599005|15080799012|6090799003|23021999003|41001999006|53005399003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGM0RDhQQXVGU2I1Z2JpbzRvbVZaUlBOZjhWODMza3FEZm54WDNQSzZxSE1F?=
 =?utf-8?B?emh2clBOOGp3aklmekZQRXFrY3FiVnBna0VxQzZvQVRvS3BJWnN6U1VucU00?=
 =?utf-8?B?eFRPOGJrTk9sV1BLT2tsZ3FxdEVWZVpQajM2QWFYTDNZbVRUU2hwbDdUT2NS?=
 =?utf-8?B?WnBQRFFVbXN6YjlXZHNGTkVTOGkxL1IyZzFmYTI2eDNnSUlvSlJSMFJQd2V3?=
 =?utf-8?B?WEJ2SHFrMEZCQmdCaDlrQXR6NUZsNmpUNDY4aSs0YVE4MFYzb201ZFVFcXZW?=
 =?utf-8?B?TWl1aW85TWRSY3VJZWw3NG1wWXcxVVg0aTR4d2c4T1A4NE1SQVcycTdZNi9P?=
 =?utf-8?B?L0lrWThma2h1UnUxSkZWZEVwZWdDR0xKMEdoTEhyRnVMMGpFT0NDaVYycHZW?=
 =?utf-8?B?aGpSQzVGNkxnQVVnM0xiZFduN1N2VGp5WFVweUlqRi9xYSthbWUvZzdJOGND?=
 =?utf-8?B?VHVrNVEwZCs1WmZNY2hLK1lIc3VDZVMvOVZVazMwY3dwUW5zeVhYZThoeWpy?=
 =?utf-8?B?NVpaeHdLcWJoQm5kU1pWTVhiMjZDb0FwVkdQYWhKRGlFTElqWFVXbG9ZcTZR?=
 =?utf-8?B?V1VkengxSzkvbEJDbDh5dCtEdExLSFNZcktPRnZBVE1xS2xEaUNpNFFaSmhj?=
 =?utf-8?B?ek1QQXQ1WHJMSXlnZmc3SHNqZkliVnUwTklWR0hOQTNjTHNtcnZUWUhuMFhE?=
 =?utf-8?B?Nk9CRzEzUkRUcWc4VnQxVE1HaDc3S25CYUs5Wk1ML3hlQ2NvWHArT3VkS0d1?=
 =?utf-8?B?dFZyOVZrYmtoRzNsU2ZVdHZheXdGdVRjbkQvR3hvd3h4cUZIRnZ4Y3kzbUVz?=
 =?utf-8?B?U3VPSWdBMlc5cFA2NzkwTTJLQ3NaL3VvdUNUa1p1YzJvcGZyZmpwaTZuZHQv?=
 =?utf-8?B?WEczQlp1Mk50Ym8wRVNmNXlTTVRiQWlCZzhTUW1WTG1HM0t3d0kvTkFJVFlO?=
 =?utf-8?B?ZW1JMlJWb1kzYjZqaUZoY3lNNEdxTmxwNnNMMVRkUFcvVUVYa3ZNaDJvN0ZZ?=
 =?utf-8?B?Rk9VNGpuZzA1dTdiVkZ1YkcxUGRYVVRGTENhdXRaZGhvd3o3VmJ0Q2pCQStu?=
 =?utf-8?B?UkQwdWw5VGlDWHRJWjdHMnp2SXUvd082dWtCLys3emYycTFiaXlvNmsxZW4z?=
 =?utf-8?B?UEdYZUd4SW44U2pXKzU3RGw2SmYxVWJQTGlwQnlzaVFRc0QwOUY1MVI2UWQr?=
 =?utf-8?B?TmJqOEhISzlKZlF5WHIydVozZjd5ckN4aXBqU1RqM1NVcVh3VGhNVWZ0S21v?=
 =?utf-8?B?ZWdZa2JZYjJWQVM3ZlhnRGlHeXpTUndZN1p3RnRFUHJDT05sS01PMmpyMlp3?=
 =?utf-8?B?MDZBZnpwQS9qNzdUYlY1Ti83OWpmN2tsVVlqaUxNYmtyUVBTeG90VTZRaFBv?=
 =?utf-8?B?S1lTY2I3TjByV09uR3l6YU40OE5ROGxLOG1LOWg5QXV2ZUJoSENveFpNM25i?=
 =?utf-8?B?UXovbUhSeFNweldTbmFRb2p0UGE2WDFxSGhUd1RmbnVieHl5Y1FIY1Mxc3V1?=
 =?utf-8?Q?6Yp5mnJZ4wolNIo9bpk4BtUxteq?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXhycjdvaWxqRUZNVVB3eUxWY0xTNDV4SkxkbVc4aGpVSmV6QzhrU2JQeUI3?=
 =?utf-8?B?ZWxmS1YzbXAzbktrd0tCR3cyZkkxK04vR2xvbExuT3FYbUl4eWpuOFVPMHQ4?=
 =?utf-8?B?Zll0cnBRajVsZ2R4UDFJZTk5dGl6VktCN3U1V3Fpck9iQzZCVCt2bmw5VkVC?=
 =?utf-8?B?STZLdDA3NUszVWhRNjZiV05TSEJTVHJPQUMwTlEvZFJlZTB6eHlTelhXaFBv?=
 =?utf-8?B?SlJyUGZLRE5zSk1RU1c0T1RvZjJFSzVxUFBWRkpMZ2xzVHhDVVJQaTlwYkdu?=
 =?utf-8?B?VTBPNHdCTkE0Z2NDOVV4NkdqdGxpVkg1Rk56R3FZb3BVUFI4M3dFVDZKdzV0?=
 =?utf-8?B?cDFDQkl3MnFtWTRwU1puODJCRzZHOUdsb1IxQncrQWZjZC84UWtKSXFyUCts?=
 =?utf-8?B?dEdLRUVOaXRGR2lDeVRrZG54Nmg3ZWw4QjNQOXhwVWtEbmNVSnkxUUZJMzl2?=
 =?utf-8?B?dXA5NDZxWlVJMDdLYjlqRExjemFxUzhsNnJHOHNMc0g5UDZSK0c0OHFHWVM0?=
 =?utf-8?B?QjVZZVNuQytNcjJsRE9rUVNHUzBzeWtHMDlaZExPM3kxV2RZNjBPR0Z6aVpU?=
 =?utf-8?B?TnYvemxiUlgvVkoxc21ldUt0NlZaOW1JNEZCZExMU1MxL1orNDBxUzRJeTRq?=
 =?utf-8?B?MHI1enI4VXp2RWtMbFdiZWF0eGZZOWxOeGZtamVabnBmc09GV29KUmRGM0JR?=
 =?utf-8?B?MXZUcUVTc1YwMzl4bnMvZ0t5bW8rbHNJQSt5VlFFcVlERkErWEJoenBBY25U?=
 =?utf-8?B?L1dVcElvTFl6UnVhdUNuS2RJa2NibVdwVk4xV2ZDZUNJTG0vckNqRUVSbEtG?=
 =?utf-8?B?VkJpRlp1V2loT2RHK0Qyc2F3RldOaDRLa1M0YUNoMG9PRmRRS0hRcVJNZ1pS?=
 =?utf-8?B?eDJKb2VsMUo5SW5UMWRzbEFkbTZWVzRxRkZObGM3RXAzL0pkWDVRRDk3NWhI?=
 =?utf-8?B?Y1laL2ZONGVLb1JEVmg0MTkwNWNtd05meFAvRzZmUmZraXRwalNNbDlSd2dm?=
 =?utf-8?B?VXJEVzlKSkw5QVpobG5vaVdCRUdib1pmZVFjWW4vaC9GRVNQeGVNS0hLWFB2?=
 =?utf-8?B?WERrdlpBWGVNbWI1VHhYVUsyU1lLeEk5LzdlZ2luZDd2ODV3ckpsL1N2YVlr?=
 =?utf-8?B?Tk9YRXJNNXJFQzFuYlhuRjlCZTd2RHgwa2UzbHZUSDhyNCtzWVZZMlpCL2Na?=
 =?utf-8?B?NzkvL3poNElPOVJzOUd5RkhvY2tsOE40VnBweFV0ZWRmaGZVdlYvQkE5OGc4?=
 =?utf-8?B?N0VVMXcwMzVMamxaQzJScFBmT3hTVjF1cDFzck1yL1AzRTlnWmpkWXZvRzhZ?=
 =?utf-8?B?NStlb21LOStRQ09YOFhwYUpFWk1sSU5XTjB3eklHYWhKdkNDd0VoNCtxSXNv?=
 =?utf-8?B?WHVxKzQwTjN1bUoyT25RWEtEeE9kZUV3Um1nZGs3V2wwYTU1a0VZRy95Mk5J?=
 =?utf-8?B?alJWd05nSXNOM2tuYzQwZUJxNGZ1UHNLcGpoazRxeEcvYTNUeENCTS9yeFBH?=
 =?utf-8?B?V3lTbGNSbURScEhEN2ljQlVSbVA5TnhuZ3c5eEhoSFU3a1B0VWRSVVExWU9k?=
 =?utf-8?B?ck5Tc2VVYzRrcml1NXFBc2pVaGt3N2RnN25GYmhLU3BzRCs1NW5Ddk1jOHNa?=
 =?utf-8?B?QzhmWFhIWE8zY2V4aHBqdjU0aUd4SkFrSkRsTis3U2JuM0s1aGZ5ek1ZQWF1?=
 =?utf-8?B?WEk2ODJCcUoyOEovcDUxb3ZwbWplZVd1U2tLbnlKN0lDNXZyQWtzWU9wMFVW?=
 =?utf-8?B?WHZneFAyVytTMTlWaVRUVE9mUGExVWlaSW5vR0tmZHBoN1hwTU9tYW1RcFpw?=
 =?utf-8?B?Vy9DN0J1Mlp3aGxQc09MejlKeFkzQzU2UHpPZENWL0ZxRmZ1SmN3c0R5dG92?=
 =?utf-8?B?MzMybEovVlc1OFY1ZzRGWWt6QUJOWkRtcE1LbDA3Wm1rTk5PQ0hqdWpjT1p4?=
 =?utf-8?Q?pdGjS3xPmXM7SSoA1RSZ3NxiiNiVKQ8g?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c21049b8-cb8f-40af-200b-08df4a91a002
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9189.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:15:42.9595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6600

For a probe response with a Basic Multi-Link element that has MLD ID 0
and a per-STA profile, cfg80211_gen_reporter_rnr() adds an RNR entry
for the reporting AP. If the frame has no Supported Operating Classes
element, it derives the operating class from a chandef it creates with
cfg80211_chandef_create() on the channel the frame was received on.

Since commit 92d77e06e73c ("wifi: cfg80211: restrict
cfg80211_chandef_create() to only HT-based bands"), that warns when the
channel is on the 60 GHz or S1G band. Anyone in radio range of a
station scanning on those bands, e.g. with wil6210 or mm81x, can
therefore trigger the warning with each such frame, and panic systems
that set panic_on_warn.

Multi-link operation is only defined for the 2.4, 5 and 6 GHz bands, so
ignore Multi-Link elements in probe responses received on other bands.

The warning was found with a userspace fuzz harness around
cfg80211_inform_bss_*(). An AI coding assistant was used to analyse the
finding and to draft this patch and changelog.

Fixes: 4d1d6b3f4599 ("wifi: cfg80211: add RNR with reporting AP information")
Cc: stable@vger.kernel.org
---
Notes (not part of the commit message):

- Testing: KUnit on ARCH=um (all cfg80211 suites), with the test from
  patch 2/2, on master 8d7fe9885c62. Without this patch each frame
  hits the WARN_ON at net/wireless/chan.c:34 in
  cfg80211_chandef_create(), called from cfg80211_inform_bss_data(), on
  both 60 GHz and S1G. With it there is no warning, and all 59 cfg80211
  KUnit tests pass, including the existing 2.4 GHz multi-link probe
  response test. Not tested on wil6210 or mm81x hardware.

- Independent of my series "wifi: cfg80211: fix BSS reference leaks
  with hidden SSID and MBSSID"; the two apply in either order, and
  together all 63 cfg80211 KUnit tests pass.

 net/wireless/scan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9b..9c873f51cb11 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -3270,6 +3270,16 @@ static void cfg80211_parse_ml_sta_data(struct wiphy *wiphy,
 	if (tx_data->ftype != CFG80211_BSS_FTYPE_PRESP)
 		return;
 
+	/* Multi-link operation only exists on the 2.4, 5 and 6 GHz bands */
+	switch (source_bss->channel->band) {
+	case NL80211_BAND_2GHZ:
+	case NL80211_BAND_5GHZ:
+	case NL80211_BAND_6GHZ:
+		break;
+	default:
+		return;
+	}
+
 	for_each_element_extid(elem, WLAN_EID_EXT_EHT_MULTI_LINK,
 			       tx_data->ie, tx_data->ielen)
 		cfg80211_parse_ml_elem_sta_data(wiphy, tx_data, source_bss,
-- 
2.56.0

