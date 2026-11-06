Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982056;
	b=BOf5rmB6l9ug5TTuzngglCcQVzjQEsxHBlrVB/eWk4YHCpZVL31LjNW9Y9BNSz2Iz9Wn
	 lQyUaM3ZJgl8JyskIqzqSDnrXrpoHCSlNOVKk30h4XKEEHYxUGLbYwgdNywI5QAh9x6C/
	 7s5nDA9nyZq3k/U+GBwU1KzZ5e2w/Y1p6ZWl4xlSIID1KEVHdoce7QGeFmOL4/NP6InLq
	 h6ISm6arM0+dRKg75frp0u0Fuc9Q1qRDU4n35IYjFqXamjJFaLKipL2cla2Woj3FpEhMe
	 qDpRClydSJFU+/Fit/kFQe58tz3888P4UFIqW1zCqRzA648RU0MJy0Ryv4FqM/LPdLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982056;
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
	bh=VsyGSVzqWuU5RP4nJ1b+ObxuNBzy4La1IauOuinMnpU=;
	b=q7eNNj8gMP+/Jy7XV+InBxyKXl9NxzKAIhIlgZHSYsoQSVp5VscduWjkT1JljshFPhtj
	 qAACjsS5WYFFU0mBcMliLx+XI1tuFHk7uVcl3WhgpAdk0FTNeJfQ/lpKwqb1t31CPF+Vy
	 VQGjY2P1tdK0RqGb0JXqIYMDsesC2AHz+6XT9uOIK1QefrJ1HMkDVD2/YHkrGy+deYiew
	 LeG+xrfYeXUXloLdcDo+2HRLQJEUbYB/BJbnWLN8qczml89kSjS+8JZgNz2z3TbmWxoGz
	 V1sjr3j1HIP0EN4lW5cZFZACcfs1qQXh6ra4MpvSt5ovNABDDa1/x6TqTw7miTxPHiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kkDCDe3W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.59
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A5606D805
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043A5606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kkDCDe3W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdKy5tOs6eo2upfVRD/0eovIlH/OCS5OEa2DkCIvpk4Or9L/4UqiRpy2pCZweyj3IlzHWuCtXfPtU0lJDk7nS9tfYM0c5rgDPHj8PaBt4o46att/fmfVyJKnxu3tQujNsL7ba0z3PBYLC4+t9dGHlpac59ZUBULa936GfVPocCGfUQDu2wTUKp+uvRjPkSgWR+2vXkJBG5Ytj87SeHpaqPKgZMp5qY1bwAnIlwF6q/TbI144grL/ZmnCVqmVFprdNbmvsOOQPHt8e/1jxceT0Oy2z8mV7tDyxodoXQT74Jtll2ff6z/4Kp7h4XMaL4CH8CXiUORo4hBuk68Gt/xhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsyGSVzqWuU5RP4nJ1b+ObxuNBzy4La1IauOuinMnpU=;
 b=YxMJpWjlO5zx/ZW0tJGPOo9GbPgoEUgutjiJRk7JRZVG8th8ByvTp3Tk+uRnCN4K+tR+bAIvlkuTf9gSzSWKOtImcPspIsaHH38zsu/mPwigNguzgUHkBGVCKT7eRHN0eozSgeFtGTFKeRrwWHusgXeXiVsdqR//xVlLxUuV+8EICTskfBDRRr7AhWA7+vrvFFPjEc+/w9r1TzqDEOrYHt83ONPvxfYtUG+m18sYgv9l66mDX0Zv0N50J9fzVQli7BD0Vjn9ZAvqWOIhNIE6hyxQ6LyI/T4rOg1SpzUC1UsDqjyr8ysVVot7BKXrKGCRTAPucZcuPBI7qhbczwzFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsyGSVzqWuU5RP4nJ1b+ObxuNBzy4La1IauOuinMnpU=;
 b=kkDCDe3WHlvuUvZ4Ldl91Z1ZIr8ri3fwJ6NPQeD5hHehvBOskuzh/zV/qy9YkuylE7Y+d7R1HdsFI9Gp7I++jckLlWRJ3rkiSqVPDbvjCz1a6LfVmDuStrzS8ZZ7uOCREafkMhUstPtT3vVRryvawuy9DTjcO1WscTSlnuBbTMq8pXB5RCs0OHXtWxs9vzHeV91Vdi2bOtvUXo1Gb6dJW6UfDtjUOq7Htyz0Yg9wjU8RMtnYZck6Tta7B4zjwDUmb90axUNCGmyMM4alxVH06hRdvrohHmG/Zy8DnjaCWvsTeqvalsbNHjpBuJnzVrCvq/4tWEXQ59p+VPEppshb4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by MMZPR04MB900905.eurprd04.prod.outlook.com (2603:10a6:190:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:20:52 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:20:51 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: pull-request: nxpwifi-next-20261106
Date: Sat,  7 Nov 2026 00:20:32 +0800
Message-Id: <20261106162032.4084501-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::12) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|MMZPR04MB900905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7168c0b6-f6c7-4011-6549-08df3c21ecc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|11063799006|56012099006|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CZqK7sh398Yg0ZaMqtktzQ5vyxLVnNldmOd5EJZwX4CflIaOKC99/Kq7PtG4LA5KGhxGOH3O2SObbkMmIDs7JziZb/GvWAOKYL4YyLi4HmT1wpNobMcL4LAwTSIvOBBCdK3jY11i4M2g5Y1mSZwKlqcZREKbUaqHlqUixMRAF3NximJpTNKWuxOkhd/YhkTcbTT4dMQkblEJbavDFPO5w+32DF9W/10OkvEVDQb2azS/rdvfY60H07Gkj5emYoB1qnVK7lIO9w9EGYEZJ2eXecvxjDbTBdwbS7AM/aePq4JPeHJpLJtk3lFRKzPtVrp6NezJVKErCLoV6NopBm3TKEgrTer7P6pmPmdO8UuudXuMwS0rntPDSf6Px7Vk24BmPVyBzRWOsJffRvTLSBx4MqU1jhrfvgLogk7Riaam7NjubIiQ1k7Epfw+qR3Z5Rhv5q1vaT3TT2J8eOh7zDJMoxXk8zAq10JptKetx6vzEec1sVu8tAwKYITfv0sIEIaC5xEjcImY9GpmTBIrLxODb02sluffNa3a1E/3OTXbmW9/N97QuZxxCvnsfHe9Esqlm6KN4pHztQSNc+mWDY4CCc8PzdDUCziA9/RGwy7PJv476gXHpf1GNeBH2+MTokY6LzPXylbCU3eGRu/kZc1+PbfkfKgEedQf7HZ18x9kQxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlh1zmSbxPAf/MP80TRdZxUhcuRnxGtT1jKlfTx8EN4UA8WvGit1cALA2eUD?=
 =?us-ascii?Q?T/cRfHi+U2Eksb6mJIbCaaYzmrOufOt9IcjCkGvmeqWxR6bo9CyTZfg5Eqmr?=
 =?us-ascii?Q?2pjAE9QMKnHUiIfkswsYoW6Esart7qKOwid94X05qMIZSzEICkv1+kRGdEox?=
 =?us-ascii?Q?mNikBjeID5vRwHWEfsHz864G0N44Kcy+yakXAepP3vdvM0t86lLMLgCObRhU?=
 =?us-ascii?Q?1ZG3ldbZrGOcVkdef/MgRhQ9RxadQ1zrQ3bmEjjzqTFyhsyeZFo2K2O4u271?=
 =?us-ascii?Q?O9EYSmsjMdJjGfP2UKCWP75x8sFYOFfqgW6Hh/V70oNbyHRWlVzmdDMe7650?=
 =?us-ascii?Q?z+Ih1oBb7yAgd9fOs1YQbaHHidLT2Fpd1k2u0mu7vPahHbkTd7zTC3SNFkEj?=
 =?us-ascii?Q?3CrBYdKc0E1e4SZSLyz2fzAHaxb4EaY5b8O9QqGhQQpFySJbWpKgckFq3wo4?=
 =?us-ascii?Q?JOOqgOe3BJEjzWUsBu2uYAwcwu9/7RKxGewWtrKNbSkuSnockEaEH2IlgdlE?=
 =?us-ascii?Q?YX4le1ZSCgqOJfk2ssVQ3z0QgJ7f6drERT/w96NnGSXWWKX3iw4/qFfF6ZGB?=
 =?us-ascii?Q?qy1vFPv9wf/KTq/XaEw/YVYrxD4K6quWBJxlqdgIc9hAsqzx0tY5sC0/RM3p?=
 =?us-ascii?Q?SDg2a7JyhPc4J0vheG/psHH1fXEXBVIajM8XkQUl764mr/GkPqXyl0oejITy?=
 =?us-ascii?Q?ePfdygHXOXqUYOtuG+UJYmrUGH6mlJ5Fobem4bRly32I0TM7Qek7eSIbArIh?=
 =?us-ascii?Q?6+QFs+PBjIfjZzjqib/lVKDNqMdPZQgAcDuMcZkkPPDGDWcLiT++U5gHrsfw?=
 =?us-ascii?Q?hzDfOgHxdgZLvqnYpKxQ3XHMV7wwSIWnoIDTM7I/vRoP5L3glzFWxxBMGe1A?=
 =?us-ascii?Q?z/ID+EBbgksb0rtaefZNnIwRAfVmNFJ7XL0mCZk4hcL/6eyqgD5efTvIDzAe?=
 =?us-ascii?Q?p2QSOwTFz8BhprXP+LDkRXOKiq35Rd7bGHpaiopZnUCeaDYdSayM9ZMxIyVZ?=
 =?us-ascii?Q?Y3mO61NgZ1A+MCXnmdo9rIQqrnrJvpvbedV8aMjIz+Knod+c0kQ3D66veYhY?=
 =?us-ascii?Q?0MU7HpWMWaR6DfXJCbSX9JARYUinFvO0anXjftaErcbKJatXK+t9AnaRPlKO?=
 =?us-ascii?Q?zpNBDzXGN0AjKwhYrqg8a6MW4SAX8qNaz4AOQxnlaFilmoKeT/c4VQ3dBJ7Z?=
 =?us-ascii?Q?MwbAeLG0li4RjMtt0WMOkW88NJzK//laS4oygq4yqi+bhn0Agowfx47K4Apj?=
 =?us-ascii?Q?w7Pv5KKboK2LpqeEv13u26O5QJRqXsMh/zqW8FLqSW9rlD8QWq5Ur5KGfwGt?=
 =?us-ascii?Q?rnbRiz0vNgk9SwQx+mMu9IpI0y9U2AicWmOlKE0qPHSXaZeRNI3Sazigkapp?=
 =?us-ascii?Q?0U7hWQ4IR1eQeJchL0tPTOH+mhVkMGpBWwlNzgHL415mF07rqrANpLIUi4QJ?=
 =?us-ascii?Q?BOO3rO1OufaNUjrvGlDdL7uSbTU4iKA/OvOWazqdGispUZpx/VsG/RzsjC9R?=
 =?us-ascii?Q?FfNnsCY0oYa4FktnWp4W9NiXSBj/D8GRVcvhKXBh7TtnHEDXZ5mnEnlc/NAF?=
 =?us-ascii?Q?G+jcCWAq4wy4jnjsKN0/BomOcw3XwgWpGQLf24hS55xTpn0um89OGm2kjGPr?=
 =?us-ascii?Q?3V08+IPBC4mW3AynTaQVuCdBhp2lmQAMc+6gryApM/XjWaC4leu8yxDLr+3g?=
 =?us-ascii?Q?eHP2TXah6Cl/ehC1BD/0Zj0jd0hNxEyw3rJyjBxfcO7069nAnx1aIvx9UBiD?=
 =?us-ascii?Q?zdBLpcdOCvsdFe1T2DIaWPw1GXhU35vGsD8So1FBzwQqsV+aoP8r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7168c0b6-f6c7-4011-6549-08df3c21ecc6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:20:51.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIw3fmaHtpQiTYBnGJqFgXqiDHYN22AasB2tb5D6HUCzOyVOXe2xnNfHBLzOA1MSaEtcmj1PcOMof5axeXMxmsg+g9o//wHh1iF+AVwv/NZ8s2yXacor08G3Otw1v1wB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB900905

Hi Johannes,

Please pull the following nxpwifi updates for Linux v7.5.
This series adds P2P support for nxpwifi.

Thanks,
Jeff


The following changes since commit b8e5b0ae8ff47240366d38e5d12c65f878724316:

  wifi: mac80211: preserve disabled subchannel bitmap in 6 GHz CSA validation (2026-11-04 23:49:15 +0100)

are available in the Git repository at:

  https://github.com/nxp-upstream/nxpwifi-next.git tags/nxpwifi-next-2026-11-06

for you to fetch changes up to 99df6d2bd9943550c87b7ac7d3bb65019afbc70a:

  wifi: nxpwifi: enable P2P interface creation and role switching (2026-11-05 16:04:15 +0800)

----------------------------------------------------------------
----------------------------------------------------------------
nxpwifi patches for Linux v7.5 (PR #1)
- Add P2P mode configuration support
- Add P2P interface combinations and frame handling
- Enable P2P interface creation and role switching

----------------------------------------------------------------

----------------------------------------------------------------
Jeff Chen (3):
      wifi: nxpwifi: add P2P mode configuration command
      wifi: nxpwifi: add P2P interface combinations and frame handling
      wifi: nxpwifi: enable P2P interface creation and role switching

 drivers/net/wireless/nxp/nxpwifi/11n.c           |   3 +-
 drivers/net/wireless/nxp/nxpwifi/11n_rxreorder.c |   6 +-
 drivers/net/wireless/nxp/nxpwifi/cfg.h           |   3 +
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c      | 294 ++++++++++++++++++++++-
 drivers/net/wireless/nxp/nxpwifi/cfp.c           |   3 +-
 drivers/net/wireless/nxp/nxpwifi/cmdevt.c        |  11 +
 drivers/net/wireless/nxp/nxpwifi/cmdevt.h        |   1 +
 drivers/net/wireless/nxp/nxpwifi/fw.h            |  16 ++
 drivers/net/wireless/nxp/nxpwifi/init.c          |   1 +
 drivers/net/wireless/nxp/nxpwifi/join.c          |   1 +
 drivers/net/wireless/nxp/nxpwifi/main.c          |   5 +-
 drivers/net/wireless/nxp/nxpwifi/main.h          |   2 +-
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c       |  22 ++
 drivers/net/wireless/nxp/nxpwifi/sta_event.c     |   3 +-
 14 files changed, 363 insertions(+), 8 deletions(-)
