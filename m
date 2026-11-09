Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243851;
	b=ByeeXfCyK90tA2bFOYavO+Z51sOtYhjzKu1z9Qqi9rDHRaHWv4qcxdu+l33ZrpoiasQO
	 6i+PkefsGyK1AvH7s6LMh+lmHrLQCKnSBQ8rH2nJZzcOZ+4h3sn/CY7E0kk4lpmUYCQXa
	 GHcO0by0vjpBvZodhMpa2onwVLoa30D7sDXd6Zgqk4DlHCaRXMD8wBtX1K34mHQQGPk67
	 laKbEpvB85Xbf10xEcG0ELoHqhtxcSXT0jv/QEQZCX40EQP6l3oOCGI7HSGMzMQrLx1qv
	 bLE9JpCOdnFHTCB1iAXJwzSoGVrtLCtQdKaVqUFlQ3xr1X4DamwbMBNNr5HfuwNiPRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
	b=5hoTaNNTlo28To88sXWtX59EXxUyzrKVX1br4Yu7RpkOcVm+748J0N3o12lMMDua45OJ
	 DbFwFIbB+DNEpvvsdskByajV+bZ+mPWqalbAqLXHq52CWf9QHt4jPh+oy3skXIvj45pI9
	 JG90MRAZ5mTJ6gmgRt5Xtl0e/zQEGjDVx+/H0Sxu+Ml3swySiUtOCIj+ON8hyeSXwpC8n
	 aLgAgcUHNcvF+pgGNBTjuxTxRCuw4yaug7KHFBS3y7ut3NEj56BELfu/HNfd/h24vmlWE
	 LeYLHLDEoykRj4uapXJUFTyVAehhjxGHr3P3XJ4SaBfopkdYT9iTNLTZrEPZZDKMeZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=W+8uT3Wm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.19
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E3606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 17:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=W+8uT3Wm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKn1XXO0R0oBTziwavwPQcDa9yjmFeithmf0Nl62BMt6J3c97RBqUl6738Dkl5bzwp27qH/xaZXONtiD6eMqZdPW700+7+AhRfn5ouzGn6QMsvpjzozsXPauucssOF0gDj9NJtOXAWt24wtlf4gY5VLHl4LB4zRBardSbjPyJ9shT0BlrZXxjNKADRO6jTQFbDMe0n50Hbuc6WULzH6P5eqFldDKLuNmbybLmuGZnkKCXvwUqm+xWA6VfX2yJBLHKMvCREaIgkF8hzM6hb0fuqs8haOfhL6w6ovXqJBNw+81D+lTLnQz7SYqMuJR6JDNKN+29JHHZ7n3KcfDi2RhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=Og2f4WNDqPGWpUukfyQGHbwO2RVLjS/Ykt3c14GUaOqbBhkRdE1nqhWGQCyq0uYAVyQ3IEk9p4xxzgT0mR/dp0CDjkmPEPXM9T3loRtKRZAYvZDE5y9E3ZKx6iH68NbYkVA6MG0jNv7tLFYI7/+uWrUlA9A29/FUqrR0+RXPe5NUU93uOAXxioPDMBX3LmbQAvfm9K91+7+OenxPD4zsxm+CqkIIrXb6jCaRGoN1MhqBlF1PkbWiaPvIz7DRcbvZ/aPO4y16o+jxDVT5AbxgsAfY0eRpkvtgsQN9gcdvZpqckblK3kiB4zkXAs8l4N5uwtIkfLgnvaTNT3fuulLRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OSVyRMwkTFhe/VYzUqR8sfmJ7deCG6+6TxSKqSqZKE=;
 b=W+8uT3WmK+FwB4wct+hU3ar1x5kEzsXt5yapqTzoJrEJMesq6POwotguYgFLRTHCBhKjpq2DzggkyI7vrFu0ZoEPnUZoaxYByBkysEG8bouE+8mr3BaYm9taVXO/whpD4dZo3xjRNBsItDpkt6foAE0KUP0DA7bVuYjbOPQJJR4=
Received: from DB9PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:10:1d9::28)
 by VI1PR10MB3566.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Mon, 9 Nov 2026
 17:04:05 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::72) by DB9PR02CA0023.outlook.office365.com
 (2603:10a6:10:1d9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:04:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 17:04:04 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id QIYAxcdK2f0UDQSmqxPFHL; Mon, 09 Nov 2026 18:04:04 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id QSmqxGYbKbtn9QSmqxKnzw; Mon, 09 Nov 2026 18:04:04 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 2C5BB18015C;
	Mon,  9 Nov 2026 18:04:04 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 23A00FE023B; Mon,  9 Nov 2026 18:04:04 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: jeff.chen_1@nxp.com,
	francesco@dolcini.it,
	johannes@sipsolutions.net,
	lilinmao@kylinos.cn,
	kees+treewide@kernel.org,
	elb12345@hotmail.co.uk,
	linux-kernel@vger.kernel.org,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Mon,  9 Nov 2026 18:04:00 +0100
Message-ID: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|VI1PR10MB3566:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8b41df70-9172-4386-8ad1-08df3e8375b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	RGqpsqvVn8lpoktMHPdggV2Wi74AM0ZgDCgWH5odBYIJB3K5RPxwumWAw7r13VHWqx2crph6pRddZ8owoaJcET/6eIANpkb0rhJnADLmTF/Z6ZW/cwvx+G4JCNOCFDDC59C46lg2zDwmICWXau4Q8zfU78EIycsspVBqJZ5Q760J76n+wYM9yJdSIY88gCBby01qIwl5G+5QIN6pKiEzXqsrFa5g7W7I1KvB8wJXN4pu6TXUKEh1a8EiGROXB+7I/8AFPRlUB4lNMgjVxUT11wIXM1/JD7hHv2mhLIyTScXAKyLP9H0XaPwNzpa2SEReZckwpemrtqc8R5CH5AaQJOjqwTPsDaQBlXlEfjCN34W51dGLSWbW1KYbRNvw1bb3cAZX0eRS04NH8LnbvIAu8s55/vv7Tu5h2L/nZrD42viAHAiWwtNanHuj3Hhd2CRiVrcbKrlSYTWFaPOvpNyeGRCjk64rRndWGbbCTWCflT3Pu53Ngf9ClApIasZziNVSJAVRP806mgtaDNx+1Rq1vmgKyFHJ/ky54adn/DukNxiJrY4qPvnATS5/KO5Rna8uNd7GuuZDPWB5kIEjHgm8JCd8ccXkNdKkn6r87E28HU1DWUjt1wRnJvfF3SgTE5FwCfCHWw09Ag7r+xVMESGjP81cGUfp5ftWKv8nVQKnb9EdDE+mlWj8ph3WLfSe+PABrh4zHaIXB1D4ST9rtcMXWg==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cXTh25mstFL9K2l24ToT6jpQNh91MTtVW5PxBb9XUmKfw4RM97MiyU8lJ2SUO9f2Vt+7fO75Y6HoxaowYxx/FxwNtFKzfF1WqcAKB7LqE3TE/VbYvhDNuHXqMok/lV6eNi7r4m41jgtRQ8k32eSdZv3K2RS6c0DmW7tgE1fWOk8yiilRtE9Ntq7vcmeGmcaf1nogQtsK5IRw99YGdsok2RBKARPkgt8BQOkqXVQlK3sQ+MS4Exyi8LaaqDbCpIPGIU5jDP3uUrNviaZCcZgOB/m2AhfGBTd0XZD3XU8WIuZjdliwCYhhLo5JSJAOvH6M4RUxqq+pKSLa6CDaqn0Y3J8ugoSJPPff0isE272SWfy05Pq3JUgvDaD0ICCbPcJNa/Rzh1Z8faMjTDA4O/0Xi1hdPlYHdNYoJCEe/BGr9Q7euIiPDk6JorpMmOxvxKYf
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:04:04.6452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b41df70-9172-4386-8ad1-08df3e8375b7
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3566

nxpwifi_scan_networks() tests adapter->scan_processing without holding
any lock and only sets it later under nxpwifi_cmd_lock. The test and the
set are not atomic, so two callers can both observe the flag clear and
both start a scan.

This is reachable because the function has two callers in different
contexts: nxpwifi_cfg80211_scan() runs under the wiphy mutex, while
nxpwifi_active_scan_req_for_passive_chan() runs from the driver's main
work via nxpwifi_check_next_scan_command(), which is not serialized
against cfg80211 ops.

After the last scan command completes, nxpwifi_check_next_scan_command()
clears scan_processing and then starts the follow-up hidden SSID scan;
a scan request from user space arriving in that window passes the unlocked
check as well. Both scans then queue commands on scan_pending_q and share
priv->scan_request, so one can clear scan_processing or call
cfg80211_scan_done() while the other is still running.

Move the scan_processing check under nxpwifi_cmd_lock, in the same
critical section that sets it, so that test and set are atomic.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 drivers/net/wireless/nxp/nxpwifi/scan.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index f3becafb9c23c..548c257a2e3c3 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -1336,12 +1336,6 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	u8 scan_current_chan_only;
 	u8 max_chan_per_scan;
 
-	if (adapter->scan_processing) {
-		nxpwifi_dbg(adapter, WARN,
-			    "cmd: Scan already in process...\n");
-		return -EBUSY;
-	}
-
 	if (priv->scan_block) {
 		nxpwifi_dbg(adapter, WARN,
 			    "cmd: Scan is blocked during association...\n");
@@ -1356,6 +1350,12 @@ int nxpwifi_scan_networks(struct nxpwifi_private *priv,
 	}
 
 	spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+	if (adapter->scan_processing) {
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		nxpwifi_dbg(adapter, WARN,
+			    "cmd: Scan already in process...\n");
+		return -EBUSY;
+	}
 	adapter->scan_processing = true;
 	spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
 
-- 
2.43.0

