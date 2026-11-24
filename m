Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503490;
	b=2OrK0zitDx6oah3rlTYl/KbnUCBRGys2AvwlLQVJPwtwTiZrvUNJI/IGEYR+DeRHgyFO
	 ciJROUQD6+NUnJ4YUR9FolkFDzk9cEdsvh/aoqACefKNrchkn9ublsakoP9cz/5uIbWlV
	 PojP542EQA1Yn8ulNK4e7519BhytzLWHPqKRWn5bbOsxvUNSL3Eb4yV4zCBlETG0wlL8A
	 3yrZaQBks1CynpcVodsuMEVvryfmT/rPtwowcearZrIUlOCTgBLL/JvUIS0PAlqAte8ER
	 BK1mOUIdZu1cNWL28ZcVCUELdyKjVEzTZaeeYEguFbaKOwxG1luuuZ+eZnkQNw4yZrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503490;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BgOt6vA+qeo4D27dnDU8VQHSPOMBdGrJFU17Ddr68tA=;
	b=0DgHL4ZMtDnRylaqZzpJveTKfL8/RJKFKbderIfPgpw7XH3a3NcVFFUOmPL/YMK7BvPA
	 P5Ny/g/T3+GqEbmsrUnFk26u5D6n9FJPwJICXGDSHgxox6w4qSnsB/91GFylRg5aTYPvq
	 GbsSlms/nJnkcuXIKIz6kWq1U/CY71Pp+gQpJkTPfNCfbsOt4Yv1Pu8NDXlWHgNMjpv7T
	 0dGFLcLuurv4EpR35autCZQQuEX0PTN9f2tgcpYjPLg/iBRbTYXB0KI0D3o50ZIJIf/Zo
	 XzvIYzlmRaYHisn/0qg1bXZchNs4W1uuF3+CEWcAFVTC2dS+xN38PW4hlRR3Pu2skZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=sIUVNJ+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.70
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E097606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E097606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=sIUVNJ+r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY1duc6z54txpOackyOUNSmwLZCNkYbIqRwIVKLsez5g46gUUYMc/0LxxIWMKQpjHJTEcFvUOYoRg8fglHRWQkj6+7CEJXqU9cB9z4/neMzpTLDWM6OKqlZyHg2KkmdkqwlbyVI5WQ/ZLpYOAPnU+3h5hymjFknnHh9M18h6BbIjZgLq6KAIsbcIqiZItdEvhLYQ7bYCzoq/JXffKS2gRhxwUDQ0gBlKsOXQtElcZJzisSuM/RIX8BqExv6ATKf3E8vEj5ocT3ClCCxIXGTjAdNtzvm/WGIdfv/B3bbzl6fQBUj2Hdt8YtPC5VOBq5KZ/1vaoDUhjK6qXykUQiCcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgOt6vA+qeo4D27dnDU8VQHSPOMBdGrJFU17Ddr68tA=;
 b=HI91fG31TVx6HoAvqDbxAl468Tjg0InFTiqPvcmrEXL+hRRaURMmV7OJy5QEWDIfaVtZz35BrHY0OpgU/GQuWn0VQI9GQiifAJZ3JStwK5SwNlFuG6OzGWEcd17NkcUw0fMcyQlmRJsN/Nmbk7wDC2EF2WHwBQglOJ5jFZwsqXXuEWt1nApKyz49MVms+X2lVf11aZnfn06b5sYWnzWZOGFcosNuibbVCyjEvUidz28QQ8z1vyjb0ElIJy/CBc6o0A34Pg7Ka74r5j9/qPrs/Nohx5b8noQsPfvPlcQW0bXDTKPAvGc0aHRL5Cl67zf8jETdkO7GyOYCBonJARUqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgOt6vA+qeo4D27dnDU8VQHSPOMBdGrJFU17Ddr68tA=;
 b=sIUVNJ+rK8QW6SNp/4IXJZZDMi3o6+w/NoGuR2B09oQPHyGauApnq9j3Dd6tOMhSP+b8CNqAtq8K14KBkrkUKanlNgb/2fnccqS/PaEeevhdZw2xsP1n6DGs1HlHQ2A8L36ROSqDX1em7vC2ymQUK7J3CRdsDHSZ69AmUgeIcveF9Eh7z86lk6EtWYwLofhUjfO8snq+ivcpukzoXvq8dcHiWPzMvc5+R+rKke1UaJaVQt0vdKQ/sUARyRjq2OghvVZHvLYoePe74CP4XrZiHajm9MCi2cU9dJzfRwuFoFwm0VQPk3mxzuwgWpL3mo7TtTJGQCejxeHdIeANDSm6iQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS5PR04MB9998.eurprd04.prod.outlook.com (2603:10a6:20b:67e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 06:58:06 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:58:06 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH wireless 2/3] wifi: mwifiex: validate intf_num in multichannel event handler
Date: Tue, 24 Nov 2026 14:57:09 +0800
Message-Id: <20261124065709.803203-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101205802.2909524-3-tristmd@gmail.com>
References: <20261101205802.2909524-1-tristmd@gmail.com> <20261101205802.2909524-3-tristmd@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To VE1PR04MB7280.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS5PR04MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d53630e-02f0-4c83-544b-08df49f84a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	I4izrM8p9Vkzj0TOylPq+EJZB7ZQybmY2Ri6TkA5EAXNbcdv0WxF9T+tw4nWTO5TnT+1sQsVYzUkTsczy+/wTooaJxp+my+7XiWExAZUNjOVJwDLcCy8SYDBkMEnO9EmZhQXP+mgloin5GIrvhQ5UsmknD0MKBH+EpN0O8SoKp69DAU5GnY6uwf/WqCLeLqYFDpCQuMqfnE1p0yvAKDG00U0WFEzJOTz5V+tocb7lxMWJyjMrRm4W6SCUMF/N11Aex7/ta+fHKVLrypcQfadIzBhN3eJTH5q642Z5CGMkOdGFa/mdMbK0obhewZaTcjd2opTMLZDHyUE++wPY/frC4F9pGNOBc3mNDRSGz/d/V+3WG5XvMqfouyYMaUfpuZ4+oCYcBPKyZtNXzAHDX40+2Av1lJGNyXNNUHBHzmozHko82+N4hn6v1hTCTcNlm1oQJ1KozBu0G9BMN9UVO7qBofST58BCQ5oxcTV/AbaPu06WNTghhH3iRqA/u4g/r14ITenT0B/jLURLOzsM0mDZJZgUV2VdS4sJGFKtIaDAqUH0G3PdcU8dLtwWaaoqoCjXZrJQwOdgSE2O+RWOT572ssTjuLEreJ/hvNllPO6acp9tR7WK933s4b2WLOVTTxzQreyIKMyQ+As4vfC4ZB/FfJlJ6rV2hD2Y78sP91OX9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJP0fHNnTy4a4BhE+NMf/NwZ54LoTPKiWT9mbs6+Oc9oHD5PyrTpb0f7BRRv?=
 =?us-ascii?Q?bqf5CEppSIygfg2StOOVTkSroEjFlcAAIZbOINGkitigrY9l2+FfJeLX9wwB?=
 =?us-ascii?Q?PXPup2/5OxIAPIjGyLkjKfIqmDeWv1Cy2Vin215pgiS8rRD1tlAwxQ+pfdXA?=
 =?us-ascii?Q?igDxtJUH5UIbfh8gencax8wV5YAtvHwLugAzAs4CC6lIdN9niGH8fnKcOqpj?=
 =?us-ascii?Q?d1YTASj47JcVqQfuRTxfjDtLTY3CalV2rOFLJOcHscI4OY1btmsr4P2K4M49?=
 =?us-ascii?Q?HI9rfUlu71vjbVEWWjSA+aQ8PDXsSzaUEEU+cPcHgyf8PJRgG9uZNvRgjpgu?=
 =?us-ascii?Q?9Ht2sLwvSV2v4CefU+VJKst6jpifHS3pjsMBStsEI2EqawSpWAVD89b7Bjlg?=
 =?us-ascii?Q?UsJmdsNr3rFH1BvNPde4PiBS7nzJoYwXBFiPF/K0Bab17zs2GWRzTHSll6Jy?=
 =?us-ascii?Q?0Ud3iuk5pxpvfXP5JkkUiAJ8rpxf0LL4/Z4zO77N1hpS0tAzkLg7H3oJ+3Eh?=
 =?us-ascii?Q?AuvcmNDPIEMketY5TtkaDL5Jxh0xZGvT3Zkq/EYQVUhT4YpbBsWswTagaOOF?=
 =?us-ascii?Q?SUllRGGRI/xHWuoFiD16uNzdqz2+e9AO2ctKGcrj5UBxND6ptiGaZiEpTRms?=
 =?us-ascii?Q?2JSWncAZ9GLqE7nVuhTe8fuTtNXfxSlDJxc19r4/SzUzcf91jokeFuYhiGdL?=
 =?us-ascii?Q?mdxpCjRT7vBcHNgZSExhxitCt06vtuqUSbszzpliCAeQgAeKiHpOybD0jOun?=
 =?us-ascii?Q?JHC2SuUZVSylPzPZKfnQ494PrFW5jtMLEm3H0c9UPM8id7PggRCwC5cXCyXx?=
 =?us-ascii?Q?8hBp2ug5RRny4YWjpc5pl3of3twyoIrq87GkJysqIEea0vGZ7r4AfRECcxwT?=
 =?us-ascii?Q?VjfqCN3jTl1JflR19IEFtbNaPqQTGM+ZCWIOd9MwTEaP0De239hpCIj2++Wc?=
 =?us-ascii?Q?bcWEXaLti2vLeLXE/MDfxAtWy4YtGsYjG9wCqTtwD6/APs4LS/7ZLCn0fV7a?=
 =?us-ascii?Q?Fb0ocF0P61qO3Qz8VvbA5BjnZeBECvgzE+HoVx1BOYDSjg0monbqwTfKr0sd?=
 =?us-ascii?Q?zgLxs9YSCzO+8ObbDIagD7kJfLksD3/+7q1BLO5LL4cS1840hyJeICINuxAQ?=
 =?us-ascii?Q?ILszN53HBu53tA+QGGvHgvjaIvf6mRM2fZBzIQn/RYYfnRww1ixkYNm/7yfA?=
 =?us-ascii?Q?2twtFFbcqTFHuor78gtAAuF3fCNhD2E9UMCg45ZRw1wgNFH4/YzDJWG8Hj7N?=
 =?us-ascii?Q?3L+B3OAxYhDgRWvwMubNpvJvr0lKRmW8z4DCr/nO7kvw0U6SIrGc6TvucW5W?=
 =?us-ascii?Q?LOGCwL8v7HiriHzuXHKBorQaOYbJvuqbo8gmfN17cmRG9PQnK9RbVSyzIxQB?=
 =?us-ascii?Q?D2GoTaYIFo/UdONwxeWH+rnHEtjyEFmHllWbgw+RL7gWpsnVynEz1Tx649Rv?=
 =?us-ascii?Q?r/VO7gybo7k8NOYyinet0cxuIbQ7iLlztELy3P+QfW6SamIvgpXpn9A8tgMx?=
 =?us-ascii?Q?0cUrDcsDs8f3fD8TY5PMz/10jqNLlcBmi6HltOpJN+pz3GpkNaBdqXwh+Msu?=
 =?us-ascii?Q?UUSZPSb9FbouXzwmU1Yd2+ocAgIJ8BAq4gYgO9tZ74TZGdoreTjF01bpR/6N?=
 =?us-ascii?Q?zAmrOSMxc4cl56GvhzczIWlCnjsWzj+giHL/mq+IHi/xiZDBb/vMq7Iiq+aP?=
 =?us-ascii?Q?1ZhYHy2p24qr7bY71btPkShayYMBe5p/8ZSZTGyZ2PQQvxHN9TFauLUDo9WJ?=
 =?us-ascii?Q?0IGGkXGa/4v8BhytZcHzYFeERFs1smjgQXxlj5eYZITUiykknDS/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d53630e-02f0-4c83-544b-08df49f84a75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:58:06.1688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2XdLYxrOsTxK+DHdi3RVBc2ncVxqO2JEQNo/Yll78EILONo37TiCbc+m6QzbA01sxab9In2XONYVKLggK4IKSW2FQzd+l3Fl42V5zLPzlqwZ9c+zfDVjo6DFnKpu/Pd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9998

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Sun, Nov 01, 2026 at 08:58:01 PM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> The intf_num field from the multichannel group info TLV indexes the
> flexible array bss_type_numlist[] without checking whether it fits
> the TLV data. An intf_num larger than the available data causes reads
> past the TLV boundary.
> 
> Add a check that intf_num does not exceed the number of entries that
> fit in the TLV data.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>

