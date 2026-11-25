Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617156;
	b=CCNC6w94d/YF9tulLUBWwhnCtP2vu1Cp8nviMF3gr4ecA+a7NSnVgT++PCk673pmthNp
	 xWfklSkkm4UbLtwzadoV9c1vC0je/P2nlnuPnFvJsYdW49ePU7BufQBILi+JtnvHVvMo0
	 +nbaXcdHWKSpAyVOvsuDFtZGHjsb0AEvKmPFxj4yKJRJueE1NJdzEbM26Im+H1SDCaBN9
	 bHF2CCLBc8GJf+y/f5XDwiGUBBPhc+rbjfnXk7VlkQWVMSKdtFDp9Ohyv3Fq5hPXjGoX6
	 8xpJHRrgpDcF4AdbIHt8IPn+it31VzXR75H0dNZ5A4hNXhx79oUtVx5SWdMbOqdbjmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617156;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
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
	bh=YU3PKtH4mbrHRc9h395Qz7FqiexjxrpOOSGXO6td22E=;
	b=uS0pK/2ra/EbcdOhPtH+iPZ/RznY0hiTdkJ0vEn+KpGA+1pKZhrNq8VKHbLbP+RugNUs
	 FvQzAHBBA20Q5paODbL+Hfi7Azzim48MV9uWyMLxiaesnhxcnrK48IAxcz/GayOSJSQwS
	 nGmZvG1YkbdCcxMO9+1ZEldJrvcvpHbQ6DGtQcxcfyNdJ/VmskYUmnY3vRBwgY/ikxpcC
	 GUvL4ee5E827a/k2b/L2xUw0YLnRVm/06lxMRFU29y+f+eSJQW6BtwjQjkNfTLWsIOWpf
	 kYAp5uClO3wiwrdldPTaY33ulRQtoEne/eVxvez9HS1LPFgr/nSRDVHygrQOOBW8AnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b="L/e5lS0o";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.46.75
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013075.outbound.protection.outlook.com [52.103.46.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78712606A33D
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 14:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78712606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=L/e5lS0o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJ0fVmyMQpak33T/oajdmYACZMi1i03isXCbChH6kmWLDra/Q1BgHcZGMAetOjnVwg00a+VD+onC8JrlP/B6N4Ef9Xijx1ilXVPpL+Lgnzx6GLykVnfx0HCkjVKmEoy6ZB8uesMrD1bnK+m+m+M62V5sGqZds2Z78vz9OVnVM/spMqoVoSpu0oyEnbDTqBp+P700Wns8MaiTw/co7uE+t+Hr56HIOwVaUQFD31of0/UOLo9oe9UH836Uga1h6H8+JGy6VTypd9ONkDN0pTAEy5OEjKuQiJWIjZhtFxWPolEf8+1o4PeB7mHDZHTAc8TWUVKQHEea0B8DKSc90aMXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU3PKtH4mbrHRc9h395Qz7FqiexjxrpOOSGXO6td22E=;
 b=sB6X2N6omihi+Ta2kTRi29xgDJO0JQVQMYPrD1tm16C/Zyp8DRoiN93KLchRlv6Y7zzDvDOdDdvselQxm6GXs7brEMnyVypFosHJbw9P/a8+JiYtFTerSjTkrxc2fZXO4GTiu1/h/sgTTdMQxCi4e07tuGt03I7EIPQlQF1f+vSm/BE81h+8VMX1PrKUbCrih1l7uLXolCBvXrGzXB9tmfMXf6r6iaAD1vSc5uzlj09LkjP+4wvJzniC9gpe9PdA64b9SbT95nYmiTizF592pX9UePNUo4UErK/ITBa35JtAqivIfJPcfPhf0N8NruT0Iry28pEpButfrDlOWquhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU3PKtH4mbrHRc9h395Qz7FqiexjxrpOOSGXO6td22E=;
 b=L/e5lS0onTEgcSrs+AV1MFbSOfrcxe9NUWxyTViJ9hbV+atwJNjXJkdYqm6aA8QYJSwW1Uxkm0c8+yncSl8a0V/34rJ5M55J0WMZXbk6QF/6RD+y4DecAXf6AuHHrEHQZmSeP/b2PlU1COiX7yO2u17ogm6AciLCcz9pDh48tR/jvpi9Mcu/+lV4OpBlQMtcuTAkGBIgKsUKTVlYUoTppkHnwHbDmOpTqnuSowj5wGtYqv7AFVEwNhGpQfRrad+Rso6w4SjtKdh2Z9ZeRjWcB8Rq92bw/yZbiKYCaxmJEoiHN/cW+X+/2oaJ4MBT12qZ4ZyoPgQozjiImOF5zX6ABQ==
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com (2603:10a6:150:dc::14)
 by DB5PR08MB10063.eurprd08.prod.outlook.com (2603:10a6:10:48a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 14:32:32 +0000
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d]) by GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:32:32 +0000
Message-ID:
 <GV2PR08MB92085284FDFF99CC81C1D8AF91432@GV2PR08MB9208.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 15:32:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless 1/2] wifi: cfg80211: only parse multi-link probe
 responses on MLO bands
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net,
 benjamin.berg@intel.com, miriam.rachel.korenblit@intel.com
References: <DB4PR08MB91891E93B7DB8C05BE17CF4291432@DB4PR08MB9189.eurprd08.prod.outlook.com>
 <z7hsmmxhck2mbhhqww3wtji5zmdixjtixkx4dw6lje7lv4kxzv@f4ieebr2nk4v>
Content-Language: en-US
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Autocrypt: addr=m.vanderwijden@live.de; keydata=
 xjMEawIisRYJKwYBBAHaRw8BAQdAhSt8XBoKcVuzaN2I1VFbR8o03wLSBTtprzeKdDTLLmLN
 L20udmFuZGVyd2lqZGVuQGxpdmUuZGUgPG0udmFuZGVyd2lqZGVuQGxpdmUuZGU+wo8EExYI
 ADcWIQTMEyts92CDKwC/+p7K40LVK7aRSQUCawIisQUJBaOagAIbAwQLCQgHBRUICQoLBRYC
 AwEAAAoJEMrjQtUrtpFJIFUA/AkdYmKA15B26VPa6XNZInO25k1iDmlw9nGUfrMeq9IsAP9y
 JvMBlSzBrOsPOO3IUma8dXlqXvZVpl6W7D3KPAX5Cc44BGsCIrESCisGAQQBl1UBBQEBB0Dm
 fcqAiSmFwZxMqLGOinFMo7z03kaO/ksCvCiQK5p2NgMBCAfCfgQYFggAJhYhBMwTK2z3YIMr
 AL/6nsrjQtUrtpFJBQJrAiKxBQkFo5qAAhsMAAoJEMrjQtUrtpFJQn0BALNFi/S3m+kqFQqh
 fQg3VAWd3GzjgxGnIM8JoLG7RY/aAP9dRyTomx1sZDi1LJTRGqOfT2Kd5sU2iAPsEBA5wZfE Cg==
In-Reply-To: <z7hsmmxhck2mbhhqww3wtji5zmdixjtixkx4dw6lje7lv4kxzv@f4ieebr2nk4v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To GV2PR08MB9208.eurprd08.prod.outlook.com
 (2603:10a6:150:dc::14)
X-Microsoft-Original-Message-ID:
 <dd4594a5-7ffe-4210-a6fa-bc0903eb0af8@live.de>
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
X-MS-TrafficTypeDiagnostic: GV2PR08MB9208:EE_|DB5PR08MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d68583-12e4-4643-d2d9-08df4b00f097
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|5072599009|6090799003|25031999004|41001999006|55001999006|51005399006|25010399006|24021099003|8060799015|19110799012|440099028|4302099013|3412199025|1602099012|10035399007|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UktrNTVqR1pxdlUvSE5qbmVqTzNRQ0IrNys5cXpZK2tGaXpoU0Vxa3psODhk?=
 =?utf-8?B?REp0S2VFT05MclJHL3JGUXZUVnYrTjZIWGFxRlAwdmg3YWk2c3NiVitmMVMy?=
 =?utf-8?B?OVJ2OUVRSFI4Z1lDMjZtMkd0TjQwVXpSWlFDNjNiRWU0WTBHbGVqazVacEpy?=
 =?utf-8?B?Ky94Tm82RVY2U05jeVltV25wdkZJU3pnclBOdGs5R29oYUZVajBWbzZ3ZUpq?=
 =?utf-8?B?aWNFa3ZGaWJEZ1ZQcDdQalA0Z1V6c0VBT2hVZHplTGlqSGhpUVpMZVo5Rkha?=
 =?utf-8?B?YWI1Wm4zVVpoZUFXWnpPZTRGL20ycHlaK0Y4NE1vMlMrMXNOWU1TSG1JVHRR?=
 =?utf-8?B?b3BXcHBsc05DNHljVUFGU2xmVGxCbnlhQ0xNakprWG1yckdpNFV6ZGQyYlFP?=
 =?utf-8?B?OVc2ajBtL0swTVV3bkd5cU5jUDZqUlV4YjlzajhUNFZUUnBYQnQxMjlqVDdO?=
 =?utf-8?B?SkFtVWVsT3NuVmlqeTVicnVpSFVQMHBTMWN2TVhZQ3NrK1lBcllGN2lKTVlo?=
 =?utf-8?B?NFF2cTlDU1pRWE9hZUIwejdLbmczVjJXNStxQWIvNTg1cGpvVDFQczBDdjN6?=
 =?utf-8?B?M2JiQjJ6UzFjZFhVcXBFeE51bVRFaE1Gb3lKRHVGOVcxZUszbnJBUjkxckxr?=
 =?utf-8?B?OGJ5dis1Mmk2b25LNVBqQWVhQXJLby94YXZVOUZpSXRuQUduRDVpbkJYVjFO?=
 =?utf-8?B?VEcwNWdYQVpnZk44aXRXdUc3cEo4MnFYMEVkSUx5a05QYVk5a0gxMWxqcmxH?=
 =?utf-8?B?RnJ6YTlRTlRpT0FUUHNpaE9hL084K2xGa1ZGb0FDTlBpc01mOWlwajJzanBT?=
 =?utf-8?B?ZDJpRVZkQXVINEU3eUUrL1RsbXUwRVM0TUQ0enNWWTdIYktPcnByYjlRYytq?=
 =?utf-8?B?eG80Y0NaazNSRnN6MHZuMUU5cUc4a3BJR0hYc09CZ0NndWdEMkRGbDM5V2c5?=
 =?utf-8?B?QnN5bnVZZzZhRi9zUFNSODJlM0E2bzFuZTlwN0FHT254YUVoSDRjNzU4ejQ1?=
 =?utf-8?B?Q0pSMUhoaGVWTXc3OWlrOUhTSjJtQlFaQmF3Z3hjK245dWxJTGdoa0hxNXhV?=
 =?utf-8?B?MHpiK2pJZ2pjMjh1Vyt6NW8rSStkWUY0czE5MDNXQkluTnF1VjR0K0ZYS1dI?=
 =?utf-8?B?YjA1SndtKzgxT2RhTGNHSmc2TTN2d0NxQStZNFVkeGZqVXNzYWZuWktXZE12?=
 =?utf-8?B?YSt2QmNuWW5jVXlYMGJWWHlyVXBsSTlNRmVMQ2lldDJ3bEtJaGl1VXRQZG9I?=
 =?utf-8?B?RmdHQlluQUttUGtQL2YzcGFtSEZtVzMyVG9PT1ZzSUQ2aU9DNjYxeDNIZTM5?=
 =?utf-8?B?bWdPVWpEWGdOQXNwM2ZCTzdCMnFKRjFSb1ZKQjJzbjlyNHhoYUFzbzRpQys1?=
 =?utf-8?B?RmhCNlFqRnZPWjBMb2N6Tkk3SVZPTFkwY1BlU3JmaGZsTmsrdCt6Nld0bjdp?=
 =?utf-8?B?eUtxNEF4b2dGQjYvNk5NbjdsVElLWXkzK1NnSzhkKzVQSnFDTmpYME1ZSTVO?=
 =?utf-8?Q?EVGiVQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUVIVDZRVDhUcUwwayt3MlFNenFOcGlFZTIvUWptZThrSGlFUlpHUnhCa0do?=
 =?utf-8?B?ZDFoNjFXK3h3RDFtQjVoSDk3eGlwZmRRZTZjVnZ3ZExTaFVXWUpETmdnTWw2?=
 =?utf-8?B?U29DTEJQSFArTHd2SW9NbENDalRRUXdHci9xMHc3U1JyVzcyMS9xajBrT3hz?=
 =?utf-8?B?QmduV3NLcTNWMUJTOURoZXl5YmNOb1hudW53TDZuV2hNdk5zNnExN1ByRnpL?=
 =?utf-8?B?aXBoN0Iwd2hpMTN6Y3p1WXJJdjRRRUF4UlZTelRwcWhhNHkxUDNzSHZBVGh2?=
 =?utf-8?B?eWdBQStqcTBoVjAreUhCSVdKS1pMMi9HUXgwWWZJOXBRZXFDVmFQL0ZvVUhI?=
 =?utf-8?B?Q1U4YldMa1FMU0kyMDZ5NURrdW9BMk1jazQ4dDl5UFNUaktMamlISDA5a1E0?=
 =?utf-8?B?RnFBeFdmZmp2dU1JZFZrbmpvQmJ1Q1JyQWRWVXBCSW54dWZFbVIzSE5UZmRH?=
 =?utf-8?B?L09rVlhvNUpoNHMzQXNpRkRMLzhpbk51aHk2RG5mZnpmZ09pUnFWVW9vdjZu?=
 =?utf-8?B?cmxQT0xvdVcwSVBWbXA3bVV5cEQwa2ZSTy9aUjYzd2JZSEVLeWZjUUw5QVl1?=
 =?utf-8?B?K0ppdncvdHJCcHhWTkd6MU5xaFlCNzBmZWxMWXl3UFl4ZDlnVXFraWoyUkFa?=
 =?utf-8?B?M0RGK3VBYUZ0TDdDQnFJazBCdzYxejExNVUrRUxZcTBBaG83eDlncHlteGtY?=
 =?utf-8?B?SGtOekRmSFliWUJMN1BpbWZja1lYa29VYnpNNVdzU3VQRCtxRUIrdE9WWjY1?=
 =?utf-8?B?dUtiT1ZkSVpDZUQ1cmMvNFphRlFibjFEWVQ0TzY5TGtnenhyTWhQUjF3Mk94?=
 =?utf-8?B?aTNDTU00ajBCYmdMclRDRUNraW1xdm04UzJOVHNLVjR1aCtWNVRieGVXY3A1?=
 =?utf-8?B?SWNUbnJWVVlvOXNZTW9panNiZkFPek1SZnpnQUNSclV4dVBVQkNHZFlnUCtn?=
 =?utf-8?B?dU9ZdWNvdVBoV0w0L1pmd1ZuOHRQQ280R0VmVk1rb2NONFBhN2RYMVFPNjF2?=
 =?utf-8?B?N2QxZVQwcStKR1ZZSjQyWEVKQm1JT0EzTTJRRyswTWdzV1J4d0RNVjMra1da?=
 =?utf-8?B?TjNIblhLWHFlYXhibGxaSzd6WFlJN2x6Y2dVWTJJU29ZZE5KTk1JTU5aVVB5?=
 =?utf-8?B?Z0ZzVWxEY2lmck1qOGNpdm9pdGpRN0dwY3ZMTGRxclBjSVBZaGt4YUp4cUlK?=
 =?utf-8?B?UjVGZG5UUWpTRUx3V3pQY2M3d0FYRW1GREh5Z1R5VGhZZnZIL2VyY0xZOUhW?=
 =?utf-8?B?dFNvTWxZOWhQSzk5clZkWk9SRDFuWDZWUHZ2bzdnMUdPcDlKQ2dLVDJkb3ZZ?=
 =?utf-8?B?VHdFbUFKUUJFVEZ6ci84OEVvUWk5ak0xNS8vbHJJZGhtU3ZlclhOYTQyZEN2?=
 =?utf-8?B?U1dmWkJLSEJDd243em1UK3lRM0RGNjRqM0RCZWw5VWFLVmpGQ2ZPY1NFNlBV?=
 =?utf-8?B?UkNZWVlmMUh3dlNuUFVhaFZLdzgxcTNPVnhFc3RCWjFsZ2V6RlpYM3hSbG5v?=
 =?utf-8?B?ckl4OXJ4N1V1cTUyVnJzclpGKzFpbXhtTGNYdjdIMnZmZmFOUGhmOUMvUGds?=
 =?utf-8?B?WWZRdG1rZkFPMFVmRFFzTWN3V3Fuc0c4MStBRnQ3OUdKQWpZZEZkMGFaY3c2?=
 =?utf-8?B?NVk4TUx1T2dhYVJucmdwRXIrVEZhZ2YwQUFYbU9DWUZ0TXJucy9xVUVHVVpK?=
 =?utf-8?B?VGxNWHVoYWxlSHF1MEFkQnFCYTREM0F3V04rdjFVVmc0QllVRnBrUElNclJK?=
 =?utf-8?B?bDNLLzk0UENUSWdoUEpJcHdLaVk5cEVLMFZPdFZyY2lOUS91SlkydDI4b2pL?=
 =?utf-8?B?cDVpWnhGWlFkQnFoZXdIVHNQb2dFSDBxd1AyNitRTGtkOVJHeVBOeXRGUG9l?=
 =?utf-8?B?YlBCYjg4REtwSUpGRGdWSDB3eE01MWwrdW44YmJBQkUwY0JXY0xNWE03Q3dZ?=
 =?utf-8?Q?Nu7XI6G7sc4DlfYhBtw7fy3qzVqAUUhr?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d68583-12e4-4643-d2d9-08df4b00f097
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9208.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:32:32.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10063

Thanks for the review.

>> Well I mean, an S1G receiver is not going to pick up probe responses on the 2/5/6 GHZ band 

Right, I meant a crafted probe response sent on the S1G/60 GHz channel itself; APs there don't send Multi-Link elements. I've reworded the commit message to say that.

>> You are missing a SoB

Sorry, it got lost when I sent the mail. Fixing it in v2.

>> nit: is the comment neccesary?

Dropping.

>> I probably wouldn't target wireless for this 

Agreed, v2 targets wireless-next and drops Cc: stable.


On 11/25/26 2:38 AM, Lachlan Hodges wrote:
>> Since commit 92d77e06e73c ("wifi: cfg80211: restrict
>> cfg80211_chandef_create() to only HT-based bands"), that warns when the
>> channel is on the 60 GHz or S1G band. Anyone in radio range of a
>> station scanning on those bands, e.g. with wil6210 or mm81x, can
>> therefore trigger the warning with each such frame, and panic systems
>> that set panic_on_warn.
> Well I mean, an S1G receiver is not going to pick up probe responses
> on the 2/5/6 GHZ band.... and I assume the same for a 60GHz receiver.
> 
>> Fixes: 4d1d6b3f4599 ("wifi: cfg80211: add RNR with reporting AP information")
>> Cc: stable@vger.kernel.org
> You are missing a SoB [1]
>  
>> +	/* Multi-link operation only exists on the 2.4, 5 and 6 GHz bands */
> nit: is the comment neccesary? Code is fairly self explanatory.
> 
>> +	switch (source_bss->channel->band) {
>> +	case NL80211_BAND_2GHZ:
>> +	case NL80211_BAND_5GHZ:
>> +	case NL80211_BAND_6GHZ:
>> +		break;
>> +	default:
>> +		return;
>> +	}
> Change itself seems fine I guess to prevent malicious S1G/60GHz
> probe responses but I would reword the commit to focus on that
> rather then receiving frames on a band the receiver couldnt possibly
> receive on. Also I probably wouldn't target wireless for this, it
> really wouldn't happen in the real world.
> 
> lachlan
> 
> [1] https://www.kernel.org/doc/html/v4.19/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
> 

-- 
Marius van der Wijden

https://github.com/MariusVanDerWijden

