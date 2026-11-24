Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795502714;
	b=shISCyPgIyLRDddSZRhffHfM4zLDS5HLDu0++qrND0Ibkqpi4b27J5EjsedXLwpQhsTj
	 Yh97UAN1WqrDNtdKvB5tR/UyicXWLsoyUunroYFDu6nI3D0H+kcKwjWVaXDKW60EIqN+k
	 UqGq5Rhb4TbovNwR52wjlOGnHZNQQQubrfLd0qqJR/W8GvlO+o68PHlLgVporP91j/sFd
	 uNKL4NDxI8jivXNcrV9PBINjRzkVV2B3STi3IOBJYN8qobcN7T2TOCOkoXKN59SDkwV7s
	 gi3wRGWCPl89OStvLJ+ORSDdRT/vSbl6eiPJKJ54jI6TZ6Smc7k03kcK7fyQK4nBqzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502714;
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
	bh=0Vn12sZIkNvvkdAAUpK3OkE/L7h0A2iqtYcUGtzHmao=;
	b=YU5fdMY2+kwkpu4HoDjN+kpshPQ5gYXnCmS5O38TIsMUdm3odUBXCc4xvnIzKb4GN1Ep
	 pKbWtaxdBvYlkytRaVLCFlWPKJt5CQRfjbGoO2Tmg+dILCXCIsXteDVwqGr5BPDexWO84
	 mhGZN9jXnoV0WAyIBvqU6tZXyQ2chWF96WpU5KXEu0R0Ofw0sFKmboFHQRXqdKP2SrQAI
	 b2NQQZMGBLQXL7UpCr6SJX27Cpdtnprb4sh+vZLuIuCJBRfWNTIS4KyezFymfyzAaLFE8
	 5dvzNI13OsTie4oisj1dob0gqm0w0oBIN7mzq7iW/RLghlzXxnXDKxt1pDcU4GCdoTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OnUvPqm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.68
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29992606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29992606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OnUvPqm8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTZyh6XKMKr2Wdqtj1ZNOjIhMJ5f0Cp4dEoone7X1AUot1KGMIU0QmKXct1RZuTvrnhVXmqHkWBiX6H/WQ7Qdaax2mrUUGTM+bMhNfnKajMXWclYaeM+YuNd5pOPQMFDxtK4at2ECBt8TykrF1UAN63tq3CHpZVoInuHaErfVf/fNZx2saPAoIrsQQ+tB/qFNpUuRQSHP3REjF23GvKE7xjCNGD63kk7Gh2PTXMMhh6tBQCYZj4YLvTEPwRRm/TNCnozIoIfEaeJi+qSKgLiFOHMdbkuSZ3qDChYyFV7gxms4ZvgSfZM22QNC4AzZYWz4y91ZNra5C5jSwukAiWLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vn12sZIkNvvkdAAUpK3OkE/L7h0A2iqtYcUGtzHmao=;
 b=Lm/P2YDHz8ZQsBzusM4SDVp+ctCSzpFwkb6O50Dp4KrLI/FtrJzskMQTD4Wjo56EJjjahdmyCiYQSqJ7Ka8qOxVmAO7eRhQvGMK++hUNgRjm4XxNdL0aeyvkUpSgEYv3M/GeEfEuFlC0MCkjApxC9pfGty/WnuForhzLQKsXm4eJAWy+LTiAIDkhEpbp/ElL1bsCdWCXWVc/OL5lFWgXxe1fWelRK728DlEyXcQ0YmkvTz/0iTdv/rCb487FtXfWwoKKblH3AZmYfMFwkoR9ZR1PsnMkblkfMZiTuB5XeeLfgJNgysA3hZUB2R+//s8oNEx003CNotOYOsyFkBtn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vn12sZIkNvvkdAAUpK3OkE/L7h0A2iqtYcUGtzHmao=;
 b=OnUvPqm8FB3iHWglsAW/2QnELI4Hk+sOlfHWrVp9YyeQpdEMVEotKR9TOO++kVcgpVDpFyvq/CpNsSi8u7xi4NLxgbvhztiMURhYMTEBEazShVRHOXFycaxkINWVt+Qa8gZlx54hSKvK4l3zMq8Uwbz9iYhvVouhO80EZSp6GpB/9ZtlokR7ghz2BKa1i00ZX17ZqC8JphRk7sw60CSQCEK6bMUPcEXOTNwlUCANOn1/zTDH6j23N9/aa3pQSx1twydiHOo1cpec2E++C+odihdtgqEC1cxF0CbkwIFyJknaSzUE3k1xFdix9xkiqUlLiVfgpKB4uTaUk67xFGfQ+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:45:11 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:45:11 +0000
From: jeff.chen_1@oss.nxp.com
To: Vishal Gupta <vishal.gupta_1@philips.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	briannorris@chromium.org,
	francesco@dolcini.it,
	linux-wireless@vger.kernel.org,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH 1/1] wifi: mwifiex: synchronize scan cancellation state
Date: Tue, 24 Nov 2026 14:44:17 +0800
Message-Id: <20261124064417.802648-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
References: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS8PR04MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 310288e1-7fe8-44d5-990b-08df49f67cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/wZrb4ztuaBLieF9XtPOBRqw1UkAtsDzO8vZ7rc2yjwzIylboZSwz++ZT5zlTVzDHKjSqMcFhbMijjADknb9cdt4CmrRAai99JlJw5bNYuvTAU1o5AmKLWdWR3wSU1u5rTnYVVWUnPc1kXbxgqU/ukiIJ8rNpQLsniUG2BPZEWSE1BSBfK9lqGqXOhDGKQUCvQGmXdSH02to3G72f1h1bbrM6pkvjJX1BAsfsLzU3JcnCzqU79xnjlTzT7RsFMJ5WjXH42ioOpHR8z4x7p7srLGzDNYzjMfOBUF7lrpxCVNsXCOm/eqXDnpwu5rORx/XBJGiHSuHi1EpXeP+u5KDYDO+99ZQLSWHJIB1f//lOVm3uSfCypiz7kRgMnRgP55QTtMenfDx+VrgGdVBM3YsY2cqV5PLB5A9iJt3RGAjZmNgSPKXZDFUdq3pQGZ2MdbNTM90olJs0a0bJxbIEyYOWSRpj9nyBojwixadL5Ifg4yCLQoO5gb9m0tx2AnVIFCFXBvdeIzdSA0QuMmmpSJ4XCkwLLO8TTnC/dFoLxvBS0tqHGfzU4UpP/VH2OMbIVFzYSVusK9feI8JTQ0Kilpzpz12wjbgrt5dOYljpZNIzYXJwIOhxuGXQwUQ6fUq5tWqjP/ORKveYyIydL0cyTRlmRuh65SLaIfK4Wje4x7PvHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HqKcvIJtO5XK3kYJSd6dn4mQhUYGWLKSm7g4Sqi+lhMzkp1crafQrUETCW2q?=
 =?us-ascii?Q?h/3An10iuWPpOvKhtI3LFFAF50SaSL8PTqCFWfaY170K8myGVa8v0pdk/yd9?=
 =?us-ascii?Q?MQkR7RECQ8+LznV0FDwy5QWoGUxHcetBZpwMVRatuvse99srTz2hep0/wrT0?=
 =?us-ascii?Q?DKEC5W2ITL3vHVWzFrjLQS/9pXQgzu0svFA3jjbuD5kYUbxjq3RpIv+W7GsW?=
 =?us-ascii?Q?0QUFjsJ7tPR40awoAUdypZRdEodpD2DcRxl5ihWygV+4fZiNSelpMYqbk/t7?=
 =?us-ascii?Q?jdGf8XH4XLidM4+ihPEqwE18R2MrwWYLXl+tg7LF5dkOOHjEhy4drNQwCQQT?=
 =?us-ascii?Q?BGdzqRZDseTRMEZX2JDE5B95JVPeLqtUDJZiE2MEbbBRTMHtuY9uwM016rfL?=
 =?us-ascii?Q?kXYmFlyDxii/OOMBLHQ6sWAhbfXw8lxwgqF2V49cyNQB0sMfY4dR9C8Ss7Wo?=
 =?us-ascii?Q?9rreaCcs22jjz7rmqoR4l0zY56xwsR6QLNPQScmANmoAdoDGSyKIz88T4i80?=
 =?us-ascii?Q?OmFDJB8FGJwsVtqfIvG7ny3Td5tvf+ba/mgacf1al7cHKdbdPFLujCuNrwXx?=
 =?us-ascii?Q?7ZneW4ygGJrrNTTfwa1GFnzJjyY/QwYbfILZp0i4iasxw1EHNMfoMi7/u5B8?=
 =?us-ascii?Q?5dsHIBVYfthhDDUZht5l4PDNWoZzqutHRSOPwbLaSjlczp8gYKhRuOc0h30L?=
 =?us-ascii?Q?teNL4evh1CQTVA6AjwEVVwu11D/ekHNNti5oc2PdrjuKUWqQBjXPOnP8Dqeq?=
 =?us-ascii?Q?TPf1FLATmaibUAKbSRRzGsh7O+f8o2Q/6gCQPl6jKeckWKElEm7jRPiQtuk8?=
 =?us-ascii?Q?AlvAwiNZ1mSeEcb1IdW8FKQrwmv9YWSoWeccJCyz80Ff7dKuHln5yImPvfT9?=
 =?us-ascii?Q?7cK69/C64+xkJ0N8E+ht3fHSx/NRHWqKEOfFj7d09K+8v642/gM0AxMbC2M4?=
 =?us-ascii?Q?h9JjmBIU1LVU5c7yZWD+RTBRgPDzaq6ST92sakKc2ZxmoEH5KlfMubUH3OGL?=
 =?us-ascii?Q?M14f7mrSBCPzd+IUjSvXvUpYcHqk067gr1UxGsbf5A410wjAdI+DFWAQKaEj?=
 =?us-ascii?Q?+5xH0TgcGzY6ljQ6YwVXVjxeBMxYoxEHZGYHqjr6O8aSO5onO9V7jcn2dYDT?=
 =?us-ascii?Q?mcCqiUqTrf2vBCHJy4qPOdEw737NGNmsKrGD8xv7Y0z5ezM7tVYK4ryi/J2E?=
 =?us-ascii?Q?AR5qHmwOFIVb0jBZKZ9c3FG6OwDjKI25ZAM4xUhRGV5b11z6x16IrVB7FNPd?=
 =?us-ascii?Q?OwtN7zUJ14LskcDQmlIqyYkA/dy1/HFIDXLr4sMdmorKuPq5DRqh6uwyfp+V?=
 =?us-ascii?Q?GsYrp+ilHNBcUnQcEsPVkZgZJi+NDdO6xTOFrn0YU9ZSWirw98yisvCzXDje?=
 =?us-ascii?Q?mS913Ao19btqMHZfnpGWj6mczkbMXsSLzJRUDCDgRrRE+NLvpm6BvhQK+51/?=
 =?us-ascii?Q?OT1P2xArKENJFssiuoNSXsU15Ukl0QFUaxAgDJimXRT5uH/2W7tZ2m+nGneC?=
 =?us-ascii?Q?RY5RNBFr9YPkFhje4YD6LKTi27xbQn4QXq6Tvh/t89tTB1kxZuPKYKZlziTG?=
 =?us-ascii?Q?0eCtJ79qgAPtKOnTN7pZSB3127HyeAJQS8PDQLlT94vVS0iuMqiW4gJkaKH+?=
 =?us-ascii?Q?v5SIv46ymukXjU59iEez3Ph813Pm9ZcA4OlfJRIcIZt6zn+8LJ0Qrh/8aLX4?=
 =?us-ascii?Q?u0L4kPDTdjhbQ88IdvR540jM0kIKgTzuUnQQsfbFSRNdHEYzpDDMYnCwb7Lo?=
 =?us-ascii?Q?tVLj8Y/lC1a9QzCOoOfsK1HGV3hz/etOVUWQBmcDFaFgliKrzQJX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310288e1-7fe8-44d5-990b-08df49f67cb0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:45:11.5549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ResQjtqYaQHR06PA2MP0j3RzqXXiV5gcXShynfhkDCC3O2aakSgn1WqicxlF0qOlLx+5oYu93GY5PR4KJPAZfNwbGpoKGGCa1v0dYDM2xOGxfRHogBlqKncbjcZoAVi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Oct 28, 2026 at 02:58:18 PM +0100, Vishal Gupta wrote:
> Read and update scan_processing under mwifiex_cmd_lock so cancellation
> cannot race with scan state changes. Skip scan completion when no scan
> was active.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>

