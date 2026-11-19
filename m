Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075324;
	b=DcIeUDId+7ty2i06FGj6ujX7SHHp83yCDZ37mzkCT5RwhQQeT29f9e7LCpFEU0yYGTcz
	 sxEQeePZGwfDtOhbwEqxt4nv85rnb+VE6QMc9BSKk0wn/oXpwtQPa8H05KjBHTi0KMZaO
	 7cGYThHT0LyIQv4L2lvw7U3mnJY5IlR4MTBCGSjkj9it6BFI3KeFyeFxTOmMTXG7Yerua
	 vcXhzT7cPFadF45dgGr6Y9upIHnon2KYINp7UcqVQKeVnA8ar21dkplNyC92TAcHx9ewb
	 XD+5wph7Qy/TKfpDVCsctjerxhsOeFkSx2NmcgXu2Eajn9pyBI1FJCub4Cr7+0q39WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-MS-Exchange-CrossPremises-AuthSource:
	 X-MS-Exchange-CrossPremises-AuthAs:
	 X-MS-Exchange-CrossPremises-AuthMechanism:
	 X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
	 X-MS-Exchange-CrossPremises-MessageSource:
	 X-MS-Exchange-CrossPremises-BCC:
	 X-MS-Exchange-CrossPremises-OriginalClientIPAddress:
	 X-MS-Exchange-CrossPremises-TransportTrafficType:
	 X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	 X-MS-Exchange-CrossPremises-SCL:
	 X-MS-Exchange-CrossPremises-Processed-By-Journaling:
	 X-OrganizationHeadersPreserved:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=qFHo8c5Jxiv4bQqlvAiCMHWemM14XP5dnLuRZDfP5Mk=;
	b=vXo7zs9vmXx3svUpzvWGXauLVdheQAOu8TOXGcRIYNWr19AAh48kv5dbUIf9MzUFuTyG
	 G90qy9a3WHexsxS7qRtvHMsJdHmLmVZeEdTO4B6eu+j0KKIDtDTjLEAYaE/HDZVxhzdlP
	 vC6o5m4HgyaJCdAkcxr9aUfpjN10bN8wgcQdIP9HCRxmhIGTjSBrP9W1ZYCViEJaKYkh4
	 tuphi20YSPuwpo5tSGG8U2shfsdCb90IU06d3qAiVYuJzAD9eDwEu17Z5uStsJ5O3ULa1
	 9B3iIHOIhe2NQ/iNiXABJDYJ6MopU3v13c86q4AqhoiEO5X6T6Vwu5ACZCujYL4lXHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=westermo.com;
	spf=pass smtp.mailfrom=westermo.com;
	dkim=pass header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=VpBYeFrf;
	dkim=pass header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=Uq6WhIBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162F606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 08:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6162F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=VpBYeFrf;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=Uq6WhIBh
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wHE0460507;
	Thu, 19 Nov 2026 09:01:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=qFHo8c5Jxiv4bQqlvAiCMH
	WemM14XP5dnLuRZDfP5Mk=; b=VpBYeFrfvL93ujiL/qSfnSZiQKDdQFsrZV1SS2
	TLWwkv9Iy5eAbyInZv+UPyVWFkazRsqjlTB3pA7Xg0NOGHqv3qbLawAyyXv/BQ5k
	EYCQo+oZOM0D8R/JLm/XwnpTg2y3Yo+IByl9prnUydejtWnOMBxuSaAFkkYr8iN7
	mU2uVq4JuKz4xB65C2a05HJElfF31yx6oC6D9LKLaPTWCafEuLNWPyE3qnOpFkAt
	SSgRx3SSJ3+v3ajuX0GC7nJWWTFDL6xT/fihr8uB+ri2i9YlLTYwSM5Ys5+t3Izq
	ZJteMPhnpLtpzbbQznLalKuzUG+1+GCnyTjsosj0CcO2hcng==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022078.outbound.protection.outlook.com [52.101.66.78])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgaa1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 09:01:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piLIdZgwz5SyYLSPFpnG+5l77gUCTu+84T9qVDPV101dxeDBT+BW5VpQgeqtRKaEQBlq0DnwqFZV2U+IpwHcBYjN+VUhu+k2OyCmuvoW1qe0Tq/tZ4Bk+BITtCBGifckmwX0Om80aIKrN442RvUb8P7h+04fK5MOlP//6/bArO/YTSH1bP3FbeVeCDWQNChuJ2F9VbS0hSex+q8DN8fZAusTdxVBO/ZqRct3ptqwv5cir0EwA5AV3XJNHKMxbA/jA5vQVKjl/WzF3ssOzantRKVrhh2cZq1DxtVR1T8O/VZpw4jOsSEnzryWpXHi4wbOsZQM/8A0VbTyEtQ1HMCwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFHo8c5Jxiv4bQqlvAiCMHWemM14XP5dnLuRZDfP5Mk=;
 b=YY+rJsNruwJO3MgpBfYUBWgyzasljUH7nwp3TpDDb3KkgmCZ0Iy4kV5seTjIoJe8CBZUI+vu9jbJiSnTN/9lsf9+wNVmtpYpR+A7T96TpIohy6MlnQkrVbKQ+YUX770RHrmdC+ylFgyBT53gZXxugEBgZ8/R/Yu1WRI8xKHi8wSrl9io5+3FDtBQBPk2DSJ9wjhUZTT+b85r/RqNUJUvkjP/UDpbycJe38FtFh43pTwUHk7THr8CLUGMeXQKRxvpQeXjP+uvK/oXCsMpAeyNgoN42Ue/Gd8WjGBlMPGs5KsA2FtMo8jS/whaUvMS9SUHC6V8kOKPvkrnEkmmiIHnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFHo8c5Jxiv4bQqlvAiCMHWemM14XP5dnLuRZDfP5Mk=;
 b=Uq6WhIBhKseK67swkkAT676Dp6tbjR2JwunPu0LGjwofAO1m2vvO5XlKQPl6A/Qqm71xRGHtCBSrk/aplGDJg5r/qOh7kl4q5M636uty4IyhiuMMV2XRKHkt/pc+y+h9vuhDEWoUcCMt5FTiozaCKhdGd2sf/QtLXYQVp2ok3TE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by GV2P192MB080563.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:3ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 08:01:35 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 08:01:35 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 09:01:34 +0100
Subject: [PATCH] wifi: ath12k: fix WMI service bitmap endianness on
 big-endian hosts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-fix-wmi-service-bitmap-endianness-v1-1-dcd4de64b16a@westermo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5N2AEI/YrpYd0TWsOprIpWhD/3
 tDjHGbmgNBqGnBtDqi6WdjbE+jSQJnFX4o2JUPXdkxEIz7ti/timN5mRfFhn0VWVJ9M3DUCiZm
 LDNJLz5CdtWpK/8ftfp4/Jf8dK3MAAAA=
X-Change-ID: 20261119-fix-wmi-service-bitmap-endianness-1666ca7a5a56
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: BE1P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::11) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|GV2P192MB080563:EE_
X-MS-Office365-Filtering-Correlation-Id: d495b26c-16a3-4c3d-d1a9-08df46135527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|260925021311599003|11063799006|260925022911599003|260925021911599003|56012099006|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iXwMI3n1qppstdIVZAA/EuhWxqsge36u4jAjLAkb3vXRQCXPlhr3FCperC7qsDIkENYH2mwIEixndY8T1uMcNytl+gYACQ/fEUhtGg27+ZsCoMEmF0eHCA/OP7wmcTwdypXfb6A+6C3hKYXLYFXJs8kSC4OQXE1V4byDhJiKKkwwU8bSZGKy8WEXRO/ofQVc4CRVGcgN76Xm9PwW7BCXeCIL2CiA649vRKkP4Csr3OhPEIlYFjbL72m2hT3oALCfTofptMWzKRVP1bg6q4LvJlQ2qjt87L4XUFto4lnqk8bUHuuHpoLJo2aQ18MTrK5sOaQp8vsSDxr2ZiMH0j3lQFfkx0Nb2A1lDxSlj5LzFakGCEgtzScOZt8UdN5i4I4vb8FVDrm7AJCFkdrHl4cPGlE6ryrxyfktiyiogo1jxvg7H1blwdWkXPUw0R8MrVkWvGDfFmiXBVSav5QkmJwVPPfttDKTN1cUD7CkrI+j9MXTZMePWE1cyY9Qls0bY82bmM01gLjArzXkZuj6r4ISqO9heHsXBuBaavUf+ygiJ5L33rUgk2wbiiZsxY6vA0DV6NDl3QuIrRQjMXsYRYvpCcqGNEoNHoqlMyb9IADo+Naj3V+n0vYQB+a1PvJglzQRJqeE5rcS+XRO8eAn65dz6Ie2GR2wxtgS6rd97Gt/ScA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(260925021311599003)(11063799006)(260925022911599003)(260925021911599003)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnZ5d09MdEtsWHhPVFE1UFpkaXpXNy90eG1pTDJVOUtONDhKVlBid1oxaU9S?=
 =?utf-8?B?RjhkTzJNUWVYRTl5QkRvUG5QaDEzK29LeGNhSHU2T1VNcDd2R0c5RGs1YlIv?=
 =?utf-8?B?TXZ3VCtRRkJvdExBRmRjZkFuYkUrWERicjBVUm9jc1JFd0xtUHNxUXJzdHV2?=
 =?utf-8?B?YXpncDNkR0oxaVV1TFA1Z0VnaElicElGRzVObG43dyt2anlUbmlMSWxrMFZD?=
 =?utf-8?B?dmVCcTFKN1pNKzE3SnpPN2JrSS96R0UvYnlKcUVKRk5pQlBodDhpNWNaT1Rn?=
 =?utf-8?B?anQ3YzF2UGl5MC9NL1Fxb0NNU3RzM3o0NitPcjBWRDh5Qk8zNDNuM1RCZmxM?=
 =?utf-8?B?ZS9TTTc3QkZlZDhtQzc5NWtneWFXY2lpbk5UVitYcklnQW53N1NGRktrQkdq?=
 =?utf-8?B?VExZbWErV0JLS3dOSVhDQVhNTUxXOU4xWE5VYUZaOXdYQU5qN1dEUU96QXJo?=
 =?utf-8?B?aG9FZ2lqamRmSE1uL2pKKzFvZzRXRlUvdzJzQ01mRE9idjFwUHNrZmw4cTE3?=
 =?utf-8?B?a0FSQk9LM29aRWREaFR0VTdUS2dZakZVOEhJOFVFNDE0VzBlbmhFY3Iwa2x2?=
 =?utf-8?B?bGpxZ3lhRWlXSUQyd3hjaTdSVzdUaE9SMVp2M0Q3YkZVZjhPeDJoWExOVkpB?=
 =?utf-8?B?NmFFdmNkNnMxSGJDUS9nNkRjazljdFRQeDF0UmxtRnhVTmVaV05PejFBNXFq?=
 =?utf-8?B?OTFJKy9rcm9CaVNxaUNrZVRJNy82cjIzbEw0Z2VHTWgrZC9JaUVYUkwzc1FR?=
 =?utf-8?B?Q0hUUU14dFBJS200MHVTK0VKOGk4Yzh6WjVUZlZWcEduWDNkS3ZRTVBVTFhj?=
 =?utf-8?B?MjAwcjhPTFllaXNLaWxyKytWOHRHazZGUWxmY2JXZllEUEN5WHJSeFNqdVNU?=
 =?utf-8?B?bGFPYVFESDhkMEs1OVBtMWtMallxUm9RZVVLanc3TmV4TTdGbHJhZm9ncFd3?=
 =?utf-8?B?elloSGswaXVVSUx6YW9XMHJ6d1ViMUpEN3doK2hZMytBcHZvMlRhK01OY1BF?=
 =?utf-8?B?WGt0WEMvZkZSSjhGbWVqaUhBTGo4S3dXaXRvbUwxZXhjd2Q5cEhNVFlpbUNE?=
 =?utf-8?B?S2RFMkJneHpUa1hMOGl3NWJRUzlBYThyVWIxUEphTHNodWRVRFFSd0MyUzZI?=
 =?utf-8?B?NFhzdFpHT3ZRaWRBc05MSzFxdXlhcmI3ZldCQTdSTjFYcC91cWI0N1RvbVRo?=
 =?utf-8?B?R3VpOEcvZmdyTzNBRkx4eGtIVThMV0ozeUx3TStPL3RNbHJFUm8xYXNrQTFP?=
 =?utf-8?B?T3hzdHNDdkNHM21BL1YxRnZSVzcwMm1FaEZ4aFY4TTdsM0ltbDNqVVA4Tm1v?=
 =?utf-8?B?YXp6UGs5Nk5sT2oyQTRSRjZOZGhnTzRReXp6RCtyc203NCsyTURYTGpObm9D?=
 =?utf-8?B?enhKa0lEcDdVT1k3ME5zZE1hZTAzY1MvdXFEcTNld2wzUUZXN2RpNStwbW9n?=
 =?utf-8?B?OUtrT2tMMkpPbks0QVY1c2dCOTVFbU1TeDJMM0cxVDY3cEVkOWg1ZXN3OXFm?=
 =?utf-8?B?d0JqVUpBTHJxeGw3NUVCNERXcTVVMUYvUS8vRHRqOFV3V08xOXdQa2NPd1pz?=
 =?utf-8?B?YVhHdkIyTGh4WDZBYUJPS010bllBVVFVSXlvOWxzdXlkUEdqR2VKSU5nVGlG?=
 =?utf-8?B?VUVjTTBnT0RmMlk2YnNxUmpiV1ZnUXNPT0NGWmRIM082Q1BpbkoxTDRTckVq?=
 =?utf-8?B?RUcyeDRsTU9YL1BxY0RHVEROUVlKb1RaYzYzTndOZ1gyTmNPbjNyWmxLQ1Q5?=
 =?utf-8?B?WTJDUTlmcHlEc2dGTU92M0lBZlgxekVKTzRsREZpU0ZNa0hKWUpBR3ZSZFA3?=
 =?utf-8?B?NDJjRll6YzEvd3ZCeEVpaW1zbUd0QXMvMmY2S1djSmpEMlZkUGxhN0lQcTdD?=
 =?utf-8?B?R1Y5dC9uM0I1eGQ3TDJqNUQ1MXN3MkhWc2oxZnVadUVIK0c5aXloWUpoWGNE?=
 =?utf-8?B?d0RKOXJGWWorZytVRDJtaFNBa0FSWDhDVGpteWwrS3lxaGlaWUQ1SXdrVVNi?=
 =?utf-8?B?dmhOQmc4WHJLQzA5bkhqdTlCaFcrYUlLVURiSjVlQTAvVXY4V3ZJRDQ4MWlF?=
 =?utf-8?B?VmU1WEpobzQzVEp0eVBrS2UxdVA4TVpxTUJDb2NaT2xWamluWndtYnFzWmtU?=
 =?utf-8?B?N3FFajRYK0UrMHJVRU92eE13SFlaYkI1eDJ2aHBIeUprcnF4UXNza21qdCtj?=
 =?utf-8?B?VFhjaHlidmlCZERtdlBxRTNUNWlLTzdsb1kxRWhSMWFwcFJvT0Vzdk1ySVg2?=
 =?utf-8?B?bFBYdGtNVFpSK3FaRUFrNTJuR2hrdE5VVUFVT3Nscmp6VHdublpBSEFlSmQx?=
 =?utf-8?B?Z0pyYlBXd1VaVE4vY25pU3lkZjgzTDlIZDR1Qm90R0lHeXBEdVBZdz09?=
X-Exchange-RoutingPolicyChecked:
	e0Lxc5G5ITCf4L3O/DCd1Fstkaa3FqNMUlmShF70VzI3bh9VE17cjRGLPOYEdsWGkx8WLCC3GZWdDSs3TKBfRxcUsZKyiRLvQERGKbssvdo5ptakz7MXO+uHpONyphU0Fdhc+6Z856NdQbVW1O9BbUOJq3QqDkByl7I/3WyZOAq9bKdtvHWd1mzwPHqybU3DmX9TmylkBA78Gh3ngT1n2FOgWYtmq5+Etm0HYr4XdjvWHLJmxQYjbY2gRQ+D8TsLQ+9IsMaSmgIKFrDeBDsUOLj+aPtp13LutRYIXu5hk/3oGQ5RSOmjg0US5hULjTNu7a7cOeBoJhJAm/ZPLf3IEg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eflS9iAAmgBMxvo3qP48ySeExhcwpTqscRhBmp/DvJGzaWDQB16ACNOYaebwQezEf6TISQoPsdkE57w6G4ZN8ZpaQu/GfqxqhKEHyHRRCP1kGG+7ACuzT9RuxwTX+dXO8AGmyCo0DmMSQeTHxDfoZkccHBOimUNYpqDiC2bZqwLAIlr3O7HuoR3md/lqR7k05GZuOfpYURtSrc0T2FNdSbTt+HUDLFeile7vjTelO0x+OT1ptRrlNEDalic6OS5oBaOZwD4OXRNx4yzO+wDhnITgHQ0CpsJNjxLDkk6s0shzM2MI994K3lr1JLxBxOYvNILuoQKn7PStQCDIyzoBmdVpYJbN36DTGhqRlAOyxZ5/YquPLEsIBupCJPQnDqXgfSjgKiHtDY9k3YGTyyAU9pQw8hQA+1hTSv4+dP7gXcFqIofeM5q3WZ/ExWuASdhTlogVtp+VKIEMrFnLUzfbCSN3rEn4XJ8HsYwvEzZwgwCzIbwcEdcXDvTZhpducadno2A5OTHxVuFR3npwh07q/vDPRe8kqgTG1AWdMq/BT8RiMJu1Of7ehg0TmUb2V5PFMOz4y/xHf+8IZxLb0iGFHa/nFXYEPgHpDsJ3XqkfWdXymBCKwPfLOP90tlPiK9Z9
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d495b26c-16a3-4c3d-d1a9-08df46135527
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:01:35.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4mWvMRvdHdB/smAR3/qVrirCqzIN+gJn4cabAMgc5W6W8je+sINhULzmQ5zviYT0NkVrxM5oP4Ak9AgM53pyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB080563
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV2P192MB080563.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: gBCFzgFkSs09tCGPWnuSrhnJzwA4pKNN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfX6+FGHt+RWiP4
 Ek4c4CTS6eXGwOpuu+q6Cy4XrtcNj0u/IdbgojIqKzp5iU19GT8kbHVy3qAwExFzxbW1X7Pcflr
 gmD5xlfGyma6Pq88vq0mELeDAYv/YaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfX/WHFXAxsYT9F
 m9BQ+xjyQfkt554FKx8leJ5bMq3ZtXS5C3OzD111YtryFR5ZtTMoNr0Q8778v+AmQ9ENHH3XIxD
 h1JEDmDvpizMxSlvLiQYFJmUDQqiEyHrubCY56wa7YTEJUgRkTceyH/gOOPINpVY/QV/x0dFsKK
 53Rp9e8BvmoplbdTcnTjJPh37F1+eVvQE02aJhCG0f4dxoXJq0lfz/jNNtp8Kp7R49Gwa1GmQLe
 JHTYEharVPzrFMRdAACio1Y+fURY6IEWJLCRONJvm9uj/5KHLLKEVfVq+GnNo14yFi2+lKyqAqw
 t2ae+mAwpl0iHHoM8v6Sogoz9Qa31+fMSgAh5mmfJiFhZ0fwLCLHkGzGkCaDZMoP5ta2jaeJIhD
 zWxvI5z8/SKkkOd/Bgwx5lumWCR5NvRCbIrlvNkL3uDdZqt0TJZ0ubG3MBi154VcuxkF26yq0mC
 ncWSEsNajp0JgNqkpcA==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afeace2 cx=c_pps
 a=xTNNa3dkdEHSULvH5VBIfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=OScVLtsL0NNPnBYe1hkA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: gBCFzgFkSs09tCGPWnuSrhnJzwA4pKNN

ath12k_wmi_service_bitmap_copy() reads the service bitmap of the
WMI_SERVICE_READY event as host u32 words. The firmware sends them as
little-endian, so on big-endian hosts every service bit 0..127 ends up at a
byte-swapped position in svc_map.

One visible effect is WMI_TLV_SERVICE_BSS_CHANNEL_INFO_64 (88) being
reported as unsupported. ath12k_mac_update_bss_chan_survey() then never
sends WMI_PDEV_BSS_CHAN_INFO_REQUEST, active_time/busy_time of the
operating channel stay frozen at the values of the initial scan and channel
utilization is always 0.

Convert the words with le32_to_cpu() like the ext/ext2 service bitmaps in
ath12k_wmi_tlv_services_parser() already do.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..79ae92364a93 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -681,13 +681,14 @@ static int ath12k_pull_service_ready_tlv(struct ath12k_base *ab,
  * 4-byte word.
  */
 static void ath12k_wmi_service_bitmap_copy(struct ath12k_wmi_pdev *wmi,
-					   const u32 *wmi_svc_bm)
+					   const __le32 *wmi_svc_bm)
 {
 	int i, j;
 
 	for (i = 0, j = 0; i < WMI_SERVICE_BM_SIZE && j < WMI_MAX_SERVICE; i++) {
 		do {
-			if (wmi_svc_bm[i] & BIT(j % WMI_SERVICE_BITS_IN_SIZE32))
+			if (le32_to_cpu(wmi_svc_bm[i]) &
+			    BIT(j % WMI_SERVICE_BITS_IN_SIZE32))
 				set_bit(j, wmi->wmi_ab->svc_map);
 		} while (++j % WMI_SERVICE_BITS_IN_SIZE32);
 	}

---
base-commit: e7f0f07b3267676087a62949a35ae919a9a8e218
change-id: 20261119-fix-wmi-service-bitmap-endianness-1666ca7a5a56

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>

