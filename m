Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.39.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617490;
	b=n1h4cnXBYgDBhnjb9YLhRdNjjKArfYT0qvxVl12w/QCX3kSVmsX+ftTUNK4/W+i84s//
	 u8w6NpUtZIZq2XYw7XiKDW8r+RtDR4wZZQ1DkmvxeHBZwCgjWzPBuW8Pxa57yLKYql6nm
	 VYbejTaMMiKAeIWDJVuXXy9MzobZWFiIfwD6VUWX4E1BgGE98WPTEd+ZZbjiw0pRMuRM4
	 nIzlWlJejBCo4BL7nINbOiENCAxmmBKWdDpP50W5JoSU08DKCvA8o1Txt/sg5hv4RUo5e
	 Rt3YSrCccQiwUCz3Kn5NolhdLXB97SUkCQxivUFqH7cefgmL7sULa2LrJYIrDMHqa4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617490;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Content-Language:To:Cc:From:Subject:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
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
	bh=I0hCX2zBZcZq6XrqdsgTIr6jxhj1wDK78k9+2OwJIsI=;
	b=HCF8RIcTYrfy9EvzyVQLHZQ7BFt6F5Dkf9IJvB8b61LEBaC5BwLjClm2MdBxE6npa/bp
	 /LRQdPVwZf8jmQ9f0jnQZbtcWNwj++DtO/JCcRtKqd+CGGj+23oXiS3hhN2Ew4zW1j+9L
	 8Z1Pw7d17P1L4QrfqPRDYVTGJUoetOXqDwGg+IsrmvUySxL/4UAGKyRe6VV572FDzJRns
	 diWHvL69JvPlAePcsy4VGkdGe8nTyIxz06D0Z81XeMyK1+J5QaalijluDtB6WKFBR+N/T
	 uOR/yL0l2ekO/paBTverop0zJCN8xVB+/kXR657mWZSsJKLpd7UnQn8qBFbV0Na883g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=live.de;
	spf=pass smtp.mailfrom=live.de;
	dkim=pass header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b="uw/aiHoK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.39.37
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011037.outbound.protection.outlook.com [52.103.39.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39C4606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 14:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=LIVE.DE header.i=@LIVE.DE header.a=rsa-sha256 header.s=selector1 header.b=uw/aiHoK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJL/BTtfqIY/bHcnubA43QJlqYR9I0oXQFfbAl4t4r7knsEr9N2vu2H51TBXxaUZlJgNt2iOhwurnF4e+MSSDl2EV7YywMKyaCOhtBqJwbk3kBEcXGIbdBb48v6L9+PG4hXZDuwtHg52Neps0Q5a8H2iSaqRPpW/7flh+T7c3YNm1Ap2oS7Vw9ZDrB7vv4rVIenXgn3Ft6uEffJKETelfIc/TmemZGZC94QeAiOLEjllTkxPffQZhngdBF6Ajh6ZI4KCNkEeuhwtusDlgkdAB1JyB6UAnJt4jIALcnmanPJIRI0/T2evcdYwWQGx9TsfLvCJOPwzxLKANds1PQidsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0hCX2zBZcZq6XrqdsgTIr6jxhj1wDK78k9+2OwJIsI=;
 b=WwmJmz9HKeLXSQrSu1/Podf79PQF9A7wJ09u79UVNYIBHRxLfg4C2XLDxcxY2efYGignhyBcKEDazOxjf94hL974FQXvI76311R1WlFNfw/KmiAYfxIRDAjOSC4/CNSbjrmmi2xYvfwULUZ9Ly52CLyiTGwtYOOE6sx/TIfGs0/O7WwnqqNRoryMDEUMXJFMTlP2OkFARHCOjTa4TBp7S5JOQ5EnUhl8xZSLiJ/TISM6UjylAa9MXq0jDFzzff14nSqKOoC+5LHPWQyPpxBC33i8Irk3S7zYdfkWgDRGH56/Kal6I/G9a0bYCfTzJ0/LHXgq1f8tvCYlrLitA9GbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.DE; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0hCX2zBZcZq6XrqdsgTIr6jxhj1wDK78k9+2OwJIsI=;
 b=uw/aiHoKg/Mqc136BKWZz8cOBJox3VQ/wM2IwtPeeOunEf9Z8Nhr7EX3S/2aw3Xw7fUWj+eGK3R+rtZqoaysoUFqtKkN/Q6doqJRaGtZNoiHnWesNRmy8tInQkelF3KKcQswJw8OdzBJhWVj4OvUuDsxgYlaxwfGwdV7WZU7SK17M6fCoFGtLrMou1LRvdjsS/QsEQpC6/TmMYfiI647A2tr0l35MB/HejmBlOzeKceOeS9iYk8Zbx/wmjB/qCPkZJrJVm2v/ayfo2h2+jTjYKmugX054N1fvRpOFblHUZpsi6Pbyq+cKrvDyjKTO8sKbO541PRv7nj5zuNJH7V1sw==
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com (2603:10a6:150:dc::14)
 by AM0PR08MB833722.eurprd08.prod.outlook.com (2603:10a6:208:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 14:38:07 +0000
Received: from GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d]) by GV2PR08MB9208.eurprd08.prod.outlook.com
 ([fe80::4728:ba8d:79f1:2f2d%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:38:07 +0000
Message-ID:
 <GV2PR08MB9208F6B68BAEDA5A77E859BD91432@GV2PR08MB9208.eurprd08.prod.outlook.com>
Date: Wed, 25 Nov 2026 15:38:05 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, benjamin.berg@intel.com,
 miriam.rachel.korenblit@intel.com,
 Lachlan Hodges <lachlan.hodges@morsemicro.com>
From: "m.vanderwijden@live.de" <m.vanderwijden@live.de>
Subject: [PATCH wireless-next v2 1/2] wifi: cfg80211: only parse multi-link
 probe responses on MLO bands
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
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To GV2PR08MB9208.eurprd08.prod.outlook.com
 (2603:10a6:150:dc::14)
X-Microsoft-Original-Message-ID:
 <3476ebc1-5d45-4f1d-99e3-d5447370ddc0@live.de>
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
X-MS-TrafficTypeDiagnostic: GV2PR08MB9208:EE_|AM0PR08MB833722:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c90b950-d486-49ec-6988-08df4b01b80c
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFoGqEgxaY/OAvK55SjXyV7lYtEZrB2HoChBdAZfmlXVdZRJ4sBI1pC3o4+9sDniITncnyMxySN9czlGudQYZKJgb8thtZAbFoYyNC0xsHS8oRgBvHgc++JfBo861qr9zl4Mk6TCxnxhd1mlSIAtWFb4sY+oyyrboLhyFE8lTWm+628VkTGRQWgu2Jp2mrWvGYnka5KJk6qawB7qXM8soRCM+o+VkcqluS5O2GFVTT+KlkCoTylW/LOJtn27hI6pbZHAm1SsBggW43D48niQCVO63s7Q1QZEbyg8W1iMiOgM7XijiN4UJtU1V7Y3NLZORGsqHfgYCQvH5hWuBZ9Ohygp8v72ZyywNXigatRbFZDNf4mAGq/CranbGeFAjZ9aX3HRDRGLfxxIvUIXz2BSWidjAZHFlpsTqbxIn6p6tpptwKsoWLpwEoiA1gblkY4HZtiFIhJGMeOewcauHRWlgn2AZHnMXhnYtY0z4ORL53eQs89UoRiYfyIflwEUOF2gWE0q+0Ub+8Sl2/kV+jLcJ+KJcHIecOr3rYt+f9yLl0DJJMYS7XzT/3yz9MIJQbPvDoZrNJ6m9JNk2w0LzlRgLv4HR8tR/4KURZq6GbY6QCUilUH0Irox9h0HxEAEZveV5fTA6cC8mtxnpsii3vGrlCPsUiz86J6bb2acT8GZGvVWqt9CQoA1L1IfbN1yJt+GUTmRvYwhcUcF1mTx9g1qQ9DvmLb9LGLlVqpENJFuVjqJGNiuGgS7E5IH
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|5072599009|25031999004|12121999013|23021999003|5062599005|41001999006|19110799012|6090799003|15080799012|8060799015|24021099003|51005399006|25010399006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFd3bG9QZFh0VkNWNzRFVEFuRnNlRVBpMXVzcGV0aUEwUUZPNXBhd3UyNjJu?=
 =?utf-8?B?WlBjNHhEUXNJQ2VWak5NTGVtaDQ0bmFqbEllbUprQWVNeExUV0NHUHlCV2Vm?=
 =?utf-8?B?R2xxUTNQOWpUd3RnQXJjYXFDczkwTytpWFFhNDE2ZG9sSUNZeUw1ZldncjlU?=
 =?utf-8?B?ZlE3S0poM05wU2YzZWtLZkxiU1VBS2hjY0QyMTNiZVRhdDR2czVsdWlLR2s1?=
 =?utf-8?B?amxKRHpqaXB3UzkzTmYyWGYvcStWWnFXMUE3eEc4eXBzeXRhcUVHMjVCZ2dx?=
 =?utf-8?B?R2w5MTRZSGdldGh1Q29JT2MwUXBqNkdnMlVyTFlMQThJYzEyVUhUN3lMWExv?=
 =?utf-8?B?NktQc3R0M295dlRhVjgvSEpPUlNSd1RKSzZwWXhqT082anJOZ04xVGdjTUJC?=
 =?utf-8?B?T0RVaTEzTUM0c01rRkRLQ3BqNW1CbXh5NFdqamZRTFN4aWVkYkQ5RTRuYkdN?=
 =?utf-8?B?Snpzb3ZCanZsZjJrRmVUQVJucWJxWU9PNmVSczhVUHo1MmdKR2JRMUJzWFpP?=
 =?utf-8?B?WUxTV20yb0tWSkFWQS9HTmR5bjRQbUxoenpqNmxoenV3YzNvN0ZQUktCWWIx?=
 =?utf-8?B?dHZ3RG9VVFZUdnBiYkNRL1J2ZjV2UHFoeXI5NjFnVWJKbDdqbTQ1SXk2TFZH?=
 =?utf-8?B?c25wYnRZaDUwUWZkclhGelR3a3VJVUY4ckNwZldyY3NDemV4MytCcmp3eGRV?=
 =?utf-8?B?bE90QkpRWGhlUmdGNHVpQkpMRUgxcldiRUhrWDhMQzVSQlFZeC95cUQrQXV1?=
 =?utf-8?B?TTIySmJSVVlTcjA0T0R0OUw2cmFGbUh6WHY5MW4zWXFSaUxNQ296SjZod1M3?=
 =?utf-8?B?VGswNm9nVUJ5K0k3ZXc4a1N6c1JzL0xpNXczLyt5R0kraDRwZzdTazJsK1ZB?=
 =?utf-8?B?NG1jazI5d2tyN01BNi81bkhWd3FhbytkOGY0Tm9xY2JBeXExMHRpUHFsTHo3?=
 =?utf-8?B?YktDSEFoblF0NmV1anNxWTlKYmVKUng3dnNKSXcxWmV4Vnp5NTBFOVhTV0hF?=
 =?utf-8?B?VzJYRGxtTW5oREYzcXdwT3MwSkZTS0xHM3FtMHVaOWNvNFRhNXpYVjVodnkw?=
 =?utf-8?B?L0VENTE4aUpIYzVPc1RNR2pZS0gvVDgwekJMK0ZmaE1zUjh6ZTJxbTRvOSsr?=
 =?utf-8?B?M1pPU1FlUVEzMnlNekZNaUY1dTNnQ2VpYkVCSkpSeWJPN282MVowVkgxOTRu?=
 =?utf-8?B?Z2RSNHFZNE9WVGwzcThXY3RITE5vS2NvUmwvaXk0VHNQcUxZL0loTmk5V0JJ?=
 =?utf-8?B?bHRYWGtKV01oTGt4RktqQ1JjSjZRSkNIdDNFclg3NmpXenJISUtyclhUaEFl?=
 =?utf-8?B?YkRQRkppM01NQWNFWmZJTElZY3RCZ3dqcnFvU09FUy9FRnJQemp5akxrakNI?=
 =?utf-8?B?U2gwQzQxd1ZyNVAzYXE3NnNIRDBwMTBuQldtMmx3aE1OeUhEWEJFK0hPWno1?=
 =?utf-8?B?cjM1SUZPb3hJZFN5WWNCM1B1Z2hzOEhTMklHUkwvcXRHWGYxYkZUeGlOVm5P?=
 =?utf-8?Q?8xRnyDu2UYnJc++wXxbjT5+3w+v?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZYZHJLZXBBVkt5Z1ZGdndXQURKOWovRW9GWkIvNk1XelR5blJ2d3RqWkla?=
 =?utf-8?B?Q1pIZGZuWUlnWThTcDRHeENzUmp4WWt0b1AyekpsVTlkS2Z3aW5xNG12c0VK?=
 =?utf-8?B?dlRLckQ5cnhOdjdOWE1uZ2RiNk9iQVQwTEtMbGxHWkV0TTUxMUFaSzBrZW9k?=
 =?utf-8?B?cjFXVDZlcExxaGpsKzFPcjhLNDFyOW15OHNlREJpbHppbVFtd1JiNno3WDZB?=
 =?utf-8?B?TnZ2Q1pheW5XamdHd052WUcyVCtsWUt1MWI1N0dJNWM3bTRMN3NXSGJFeFZ5?=
 =?utf-8?B?V2EvV1dQVjkvM3dBYjkvRVhqUm5Ic3MyMEx5aUVYMEgvcEZoN2FHTUJGeTRt?=
 =?utf-8?B?TXRXVENXSjB3ZHZXSXFMaHdGYk1KTEJqSC95MTFUMmxheXlNTVNoaG9EQkdr?=
 =?utf-8?B?SFZaRFo0TGwydUNuSk5rcWxyMFQxSGtUQzVZdmE1ZTRvR3gycFFueEt2ajJP?=
 =?utf-8?B?clArdVpTcG8xb2FuWndNVUtqV21hYUtWUHA0bDBhbFdlWmwxYkxEL0dNdlV2?=
 =?utf-8?B?bFBIZ3ZWMmJFVldPZUkxZmxpNHZOM29uUHgzeDFkQVhub3lFaFhib25qeEwz?=
 =?utf-8?B?MmdNTUkrUzRhU0lmanErOFZNTmVldnVmRkFzNXJFWkZRTjBaREJGTVQ5dkRR?=
 =?utf-8?B?bmYzR05vQW9RZytUODJrZC9kRzJXZTZTVnFmMktJOFVxVzl5SFc3TkxyNnFm?=
 =?utf-8?B?OE01dk9ISWZlM0JiK2p5Qzg0QzNlNVlac01zQmhSR3FteUZ3OW05MTFPRFE3?=
 =?utf-8?B?WHhJS2dUOS9nclJJemo1b2ZHa0V4SW1HdkNNOEY3QmNWL0hWdHphZVdtQ3RG?=
 =?utf-8?B?djJFRmg2b0JSOFU2SkZRcTg2OHNxa2ZPZTBhaS92QzV2WEdjWXczcHM3bFVC?=
 =?utf-8?B?dThzUGk3S0pUVW9xWGhMMlNVZTl6MHBJcVdyeDNlZG01aHRUdm1sR3JtN2kr?=
 =?utf-8?B?S3ZNNUJhVWl4RUtKRWxYNm93TWV2ejh1bXBCdFN6VmN4NnN2V0xWcHR1eTk1?=
 =?utf-8?B?L2ZYb2xVUGtiN3Q3VkZhS3JXRFFjOW5xUHJoMmRNSytFQllWWndwejc0UUtl?=
 =?utf-8?B?bDJVcWxwV0pSb3ZZTXhyTE1OZDd5R3owdzRnbjRqUGxXT3MzTzNucXN4ZVhv?=
 =?utf-8?B?eXpIRW8ycmg0Tm9xS29XV0R5WEF2TjQxMnBjeUhMdW43UGhBdTkxRCt0YUJW?=
 =?utf-8?B?S0tJL3RXSEo5NEh6bXpMb3dTZHJsTFZEeG1sZjlpOHMzbHE2OGtsSW5ZZGFB?=
 =?utf-8?B?VEl2OU5Ma1UvUWdUalQ2bXBUcEtsa1BHbnZTNm96aXdQZGJVc0dnS05jaTFG?=
 =?utf-8?B?MVJ1Z1lGcDhpQWd3c3lUdllyd3B0dWQ0dkJqOVdsVjU2MjU0ODc4M0RFb2VZ?=
 =?utf-8?B?OUVta243WERXcUszQWVDcjYxTGtZaFlYMFM0R0VSM2NuZ0tyYWNGUnFBeGhF?=
 =?utf-8?B?aWxaSzlaV1lyamljVVRRYWJHbXViUTFMOHh6SHJYZHZXa0hMc2c1WGxMTkhi?=
 =?utf-8?B?Sk45RURFb0phd3FKSEYrZkJORTN2WG1JZ0xZb2tTbDhvQTVjQndPNVJVb0g5?=
 =?utf-8?B?dTB0L00wSTBMN1kwYU5rNEhzNFNXVWR5Si9ubDFGNnloSGZpTnQxMmFQSitu?=
 =?utf-8?B?U0VzTXR2YnVyczdUQmU5UEp5T2FqMTB0Q0JkQ0lFOUx3VkIwNVRaVDVWSUJ2?=
 =?utf-8?B?UDYyNExaTFJ5NEVJUWpNcjNCUVMvb3JITkQwRFZEblk1czBPeVJFWE4wQnJC?=
 =?utf-8?B?ODRUTzJ3cWg1Y0diSElpMm5MOC94cmpNbGxBY2N4MlM1SGJmUWJtR3dxd3E2?=
 =?utf-8?B?S0JRNElLQ25jM3QrMk1DdVI2QUhLdnp2cDNMbEZXaTBQZnlSZlRrM0NXQWZo?=
 =?utf-8?B?UXdPOHdpOTJ1ajR4QlJBdzdVaDJlOUxMeFFwNThrYTBWYzdmdUhOMGNuRzBV?=
 =?utf-8?Q?k86FUy9ZCrC2i5zdCv5ht+46VSOPpv85?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c90b950-d486-49ec-6988-08df4b01b80c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9208.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:38:06.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB833722

Multi-link operation only exists on the 2.4, 5 and 6 GHz bands, but
cfg80211_parse_ml_sta_data() handles Multi-Link elements in probe
responses received on any band.

A crafted probe response sent on a 60 GHz or S1G channel with a Basic
Multi-Link element that has MLD ID 0 and a per-STA profile, but no
Supported Operating Classes element, makes cfg80211_gen_reporter_rnr()
call cfg80211_chandef_create() on that channel. That warns since
commit 92d77e06e73c ("wifi: cfg80211: restrict cfg80211_chandef_create()
to only HT-based bands"), so each such frame triggers a warning, and a
panic on systems that set panic_on_warn.

Ignore Multi-Link elements in probe responses received on other bands.

The warning was found with a userspace fuzz harness around
cfg80211_inform_bss_*(). An AI coding assistant was used to analyse the
finding and to draft this patch and changelog.

Fixes: 4d1d6b3f4599 ("wifi: cfg80211: add RNR with reporting AP information")
Signed-off-by: MariusVanDerWijden <m.vanderwijden@live.de>
---
Changes in v2:
- Target wireless-next instead of wireless, drop Cc: stable.
- Reword the commit message around crafted probe responses sent on
  60 GHz/S1G channels.
- Drop the comment above the band check.

Notes (not part of the commit message):

- Testing: KUnit on ARCH=um (all cfg80211 suites), with the test from
  patch 2/2. Without this patch each frame hits the WARN_ON in
  cfg80211_chandef_create() on both 60 GHz and S1G; with it there is no
  warning, and all 59 cfg80211 KUnit tests pass. Not tested on wil6210
  or mm81x hardware.

 net/wireless/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9b..430f4a13e603 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -3270,6 +3270,15 @@ static void cfg80211_parse_ml_sta_data(struct wiphy *wiphy,
 	if (tx_data->ftype != CFG80211_BSS_FTYPE_PRESP)
 		return;
 
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

