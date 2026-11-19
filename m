Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079121;
	b=LvSOnlXP+1FYXoLfJIP3MRCD1plERCRtbk1xYdxTm42opkFElfwlxLd9l7LrIhELlpd4
	 56BZpDRYihmA9GdJni/1pIbhTeTEC/pqlwWanbyUue9DLGdUX0UKj1SeDtImFrabPqCaw
	 uQppaQYJ/0fC6HCzGJbhO3crffJT3mx9pzVh6sxGE/CWBKyIENB8fmJNNVGI1Yw3rJ8gH
	 uBzIe5nqqFWvkYhqRRDOtoNu4TtjEdF5rNMjCX93S2PGqNoRm9joHYjxkElOMiyypjd6J
	 vvT8+VQjQftcqDX8lxpiMIui5d92l8jhZ6yiJ61rsLZ+apxrLh0W1Ln/cW8fSlHEX4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079121;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JNYbTo8X2qsyldyDDUaYVoitEKRjAWVatHMTL/fsefg=;
	b=3zhS4dm78bOucWpF2c6OXg9cteaL6Sg0mra4eoIDLcaTzi8tpWZGh49iw9r0QBKo89WY
	 9d4WSwzUfz7ekdiYlwWc0e3KrwT/lZTTdkNK9SVc4XpeaV8BxthThFMmvxILp/Q74sHOj
	 wGHmzhSrlVEwZqSeLnhbklNSV/ZBcHISWBlNzojPlbD+/xNuLTDiLqpnr3tJzbAIbFGTS
	 ivMXGD4auOAk6wWwL3HsoRF9BijOGiUWau+L3u/wAbkvQzy7yR6T2ioDi+OQyhRkTHhIj
	 pIte0fYiW2uVwFFbS/lIi2SisONXNx1aeIPE6r81bqorYH6KuW9z6DfO88xPm5yMPLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gqUDJux5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3EF60A2622
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3EF60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gqUDJux5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEAk82+MyanEMVU363QxFV1TOtVTfm+e4RiLiLinx0aigF6RGXZhh9TDkEH6foBZ644D6/fhgwRnxso/2edNhwKW6ylm7LC2t7jnB3dAEC1XekoyzJX7u1sJN1YVAtpXO/4IucePM90HB0GPEXwkNxg0XQ/aQOJerO9dGMiMHtlkwHD49ThvSDQwvT3hWPtIFUsjo7x7o3XXG1p8Hot2w4E15MmjMi5O6/IK6v03lXgVPywh6kFcjwbVLdNg/iWS+d0lRdA85LbNh5bBOt5cxLNSYoBEVdQugdRsRj7hLRgdvgrl5fQR0pXG1xduva7TxBF3XFBa7nMv5pB+uIj9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNYbTo8X2qsyldyDDUaYVoitEKRjAWVatHMTL/fsefg=;
 b=yKvl2G/TKtcC/7s5WjyxVFd9+hociKadZxqICLXT0K8oJLwZXSsoCOFXjH1DPvA/b7gFoiC+WAeshcZxqQyA09uIULGCpWBratIskojMU1dExbOJSCEf0Km99msNfUZmv++ncCvxelMnU/o5vVhL/tQOFUxGD5travHHygsMhQk2DBtRUymfPqEbhoGtwWb1C2WNbpl7NdyVBxYETC/xYO1bNTS+I5+Wt7SxoDxHHXRrGqn3LD01x1VLxfFzIhgIyhe8O46mP/OaQ4JqzkSJqGrZhbNmy1lR0LCxosd6H5JQwgAK03rjrpFF1WGsrEgb5bvslV50YhY/RaghuLcLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNYbTo8X2qsyldyDDUaYVoitEKRjAWVatHMTL/fsefg=;
 b=gqUDJux5gl89rf9EEvqyjYHXXsq06NLuZcgIYCs/UpSxlB38YNqHsoS+JW1C0BxCVNVa0Cqe/52Iwk0weOt90gNE4d3M474XK3/w/IXFC9gF6pSH9AwBAqPo+BdPRpppJzYCBn5ctC3w8eo+iShL8QoqNz35rm2FpiBjqUOh3TA+k5B33FvryLFcM1RUKBPUsDr+j3ZrxuRa1uyORaPBnUWmLycvzCcX9D9a9z85wfB30FyG1llVShcCIOQJLc52Vdv5v4N2WM4BFOXHUYHmEsSoCtglIozv+ovIRJaBYE4D2RkB8zCuvayLeyPG3FbhbMkHob+7vmLiyI18BOfmIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:05:16 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:05:16 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: pull-request: nxpwifi-fixes-20261119
Date: Thu, 19 Nov 2026 17:03:52 +0800
Message-Id: <20261119090352.565202-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|DUZPR04MB10015:EE_
X-MS-Office365-Filtering-Correlation-Id: b92aff52-dc8a-4658-a235-08df461c3a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|18002099003|11063799006|10067099003|56012099006|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	nBBe9TGITp4W5N26ckIS14Q8eBjtgCYttGYNoaCSd4ZhJUkv0y/M8Y1SN/eEtMyYfKVayW5jtfQM7AyPd7xlhNQJMc1v0jvXdHn5Bh1u4DGwrajtyOz1ZTGvX+3tGuzXTDuCrRyz12e3GQXYBp9IuQKDsIGsbZdKM1PTIKINGrEuJCn5WwP7WAE203oHaw/oD1mY2s0F5UuW+S3HPT1QKSVSG4ZpPESNCYKgAu08dJJpOj4YLOg2NGjkcz0p2hQzySjRX0noqOaExz6S9I8uI0VkVM6JC/PuXaYLumqX17VOoHDjUDMXDY/cX+xu5R26sgtUBnG5bO3/U1Q9fd7EePYfE50TGHJsm2sFuKUGdCYRZZ58ouPL2ljrpXJPQlYKc0Q9gqGgnUV4hAwTSLyLqUYrXGP/D/5C6idn+1lUYR/hHVZtEMlnF5dD3/k8InLCLuOijX1ghB7xA/aj9aFjmOl26DwfgNZST3DMpLdlbz2CIi5juUVp2WTeHFsDndPJXrvJLvIN0zarxTShI54Mx7lkvgaP7EWp6trEk3fqQnJ6lKTC8KoqT2A9v1joXDisTGpeoBb8aCrnDbaxsSv2FE9vtNxOKk3MKOWvmkn5Kwia/9t2kKNU0mssXefMA2dunMLjuB8Q3ABWyQbSGx0TLEVn5rRkrFATTzYz6t72kWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(18002099003)(11063799006)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZAltiXA7A+37i0ubUWzJXsuIXTricdF8d4zafjGzZMgykI51Ny2shayCGQd5?=
 =?us-ascii?Q?0Kb6v/HolstpH5XXpnjgrJdsCZGvx/UdllEXsf1+r2CwnMSxhqtckdnkvnNC?=
 =?us-ascii?Q?G0yRQ4Imk2ickFKB02fh7dt2NCg+Zu3x+CZsjpe+64xljFDRBFsSo4XYpFOL?=
 =?us-ascii?Q?nLN4XzlfZm/oOVwS8yCOK2dMx1tSKqJOcQCOsP+JKMHzpkwaZmg4sgGVI07d?=
 =?us-ascii?Q?9aH/fV/ccZ2srQPtYUrCS5M+4wzqL9WsSTwxtEr4wxBhNGRHP3wp0iQNrf2J?=
 =?us-ascii?Q?it2UTgW1Hk1UzcLpda9g0jq8kP2MkdJyGUwRDm1l3tYBRTN5vDmiibwlQZh/?=
 =?us-ascii?Q?z1LYRm7OquKtrZQHJFDBX+st/tn2ymO9UEF4Px2rxVyTg5kRqIe4rOkY6IAH?=
 =?us-ascii?Q?fXSJDKoX6dmtUJ4rQxjteOkDYYbdXMeAZgZpN9MLIk/aVobbgI1bYkSrnJEj?=
 =?us-ascii?Q?LjV7jA9lm9duhGqmD4Cb+gWoqmrL/FNxVOeO8EXTQtL1htlN90M0B3pmbjkB?=
 =?us-ascii?Q?FdK84kIPKS6Ah/xXilyQgGRJ+vATvlUIqawuS+5J4E4FcMeTaAjkG8QcQpW4?=
 =?us-ascii?Q?Ut1FrhWSNIJAcianouYTHQJVIDdILI+qDtJKg3wgJ9QnEifkj8ZW8wY8PTNs?=
 =?us-ascii?Q?Zn1w7iJ24z3YK+7vtD80r6GLdSxJikvGtH31UwId3TFAnSP3aMB7ph/ZgYZq?=
 =?us-ascii?Q?eHrCHZQDK9QNQY6/Wz43cbDzMJ3Il1L8WFZpiswajSvcRA7AKNffjxNIdL0b?=
 =?us-ascii?Q?nJ5CWevzkF5CNQPu25h3fEHdkIsJXxRqhGZv+HuxN2IJeSlYKqlersfcwbPG?=
 =?us-ascii?Q?VWF1XmEHgqpCvS4x5uwISASlu4dcfR0cg43xlfzJ4K8KuZWDAKn67tsvKQSw?=
 =?us-ascii?Q?/zbDHbpAeG2D81E+rrToFAo0F7rrVIlDozwehNB3y8VDFjjGLwvonZO9XUil?=
 =?us-ascii?Q?zgGdCoYh22d9j/0XPnzFpaPr5TpdGPAZ1dB4kWm7MNlws1a1xE8ffvTDVWKc?=
 =?us-ascii?Q?sLA8SDty0lXLmPWI+SmPsO4GHtEAjlbtG9S4HsotpxR7g66F+7TxSH1u2Thl?=
 =?us-ascii?Q?Pll6Yfzb9Pyia99rYPYOQA5Opk7Ai2IVVd1PIiaGALpmupExClOuxeRPCosx?=
 =?us-ascii?Q?Qudr1iSrlunsxbh8n21EDLMkYSL6zoTfsT43kQbkG9wZjVs601lTV5wRcWzJ?=
 =?us-ascii?Q?YxF5OG9dZIEWpuLl0wjBxv8vi0Y3TSfQ9f8R44iJEo9Bz+r2nfbouuQ+/+ab?=
 =?us-ascii?Q?7KSj1zlJC++cySYoaGGVrcUJfDbyG3gHob5q20thZRfmf3OnJuEQvvAEGA75?=
 =?us-ascii?Q?tUi25B+Cet1t7HpQNk/z/2nRdU3r1RG14nR0Mv4Rnm5zbyPuGAsLgR6fPrfT?=
 =?us-ascii?Q?VQoD8X6GHCvYrDvklKtNHUzh7761cpzqh2/MwNYTEAlm2aahGPZjtD3Es0Pw?=
 =?us-ascii?Q?4f94X3TDqhYxa3hZzjNyMvKOANqL3PbjoYK5H3j6HYOgE+1XKb2sHfhqp3GS?=
 =?us-ascii?Q?gqXvf86IIE5aIxBKhFEzztwuOGab8saY/c/3r0tfAO/HcYoBCM9C2weTbhpJ?=
 =?us-ascii?Q?mW1FXvFHnVAZnOYLoEa9VDb+NOtSSe6BD914iBKmh3rwpPVxDz7XAQSWvkHU?=
 =?us-ascii?Q?Q39ZwpkSXPljIe8iAhJ5hg8pEx0E9UFHV0lTTLzEdSHKtaLN92yvz5Dngx8K?=
 =?us-ascii?Q?9CxjqDZOSEM4uZP2WjQH7Q2PNch9JqX8RzYkKSFtidzBbBxLTNyv4AlsMVvz?=
 =?us-ascii?Q?hevQ/VTP3z+kY2HyrGjmMOechaprQdW85RaPMXMQ0BoZyvR7yNn5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92aff52-dc8a-4658-a235-08df461c3a53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:05:16.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yHBx7v+S3xQWp7vNXwK+zAw6xc49tBFlDjuwrNoBXCOq3sasMMT1NU6UluQzXk+lVC1qBvZwmdrVjRFXeLijYX8rZ5r651iYUF7PbT/QauZ8D0dCyN2u5uMwImSYy8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10015

Hi Johannes,

Please pull the following nxpwifi updates for Linux 7.4.

Thanks,
Jeff


The following changes since commit e203d8a4751d48aa00eda31e3b320ba8e0d47dbf:

  Merge branch 'intel-wired-lan-driver-updates-2026-11-12-i40e-iavf' (2026-11-18 17:49:43 -0800)

are available in the Git repository at:

  https://github.com/nxp-upstream/nxpwifi-next.git tags/nxpwifi-fixes-2026-11-19

for you to fetch changes up to 2d9943c3aab162c84dd1f894efddf3c8b73b94f8:

  wifi: nxpwifi: stop AP when delayed channel switch fails (2026-11-19 16:38:22 +0800)

----------------------------------------------------------------
nxpwifi fixes for 7.4

- Validate TID values in ADDBA and DELBA command responses.

- Fix a race on scan_processing in scan handling.

- Fix calibration data hex parsing and add a missing command
  header definition.

- Improve AP channel switch robustness.

----------------------------------------------------------------
Luo Yifan (1):
      wifi: nxpwifi: validate TID in ADDBA and DELBA command responses

Viktor Korsnes (2):
      wifi: nxpwifi: fix hex parsing in nxpwifi_parse_cal_cfg()
      wifi: nxpwifi: add missing header to HOST_CMD_CFG_DATA

Vishal Gupta (1):
      wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()

Zhao Li (4):
      wifi: nxpwifi: cancel channel switch work on teardown
      wifi: nxpwifi: stop AP TX after preparing channel switch
      wifi: nxpwifi: own beacon data used by channel switch work
      wifi: nxpwifi: stop AP when delayed channel switch fails

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 23 ++++++---
 drivers/net/wireless/nxp/nxpwifi/11n.c      | 16 +++++++
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 72 ++++++++++++++++++++++++++---
 drivers/net/wireless/nxp/nxpwifi/fw.h       | 10 ++++
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 drivers/net/wireless/nxp/nxpwifi/scan.c     | 12 ++---
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c  | 37 ++++++++++-----
 7 files changed, 140 insertions(+), 32 deletions(-)
