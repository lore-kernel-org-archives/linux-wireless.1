Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794407447;
	b=n7E8Z9DpT2vHnNhNypMALerZxA1pu0guxhEG9b93MITda1mWHjJrldIM8XYBsjqBnbKR
	 j+9FicjT5CqP7y5YfqvfqtxQWOcK1Fck7CRrslu5O6Jj1vW5iAuSswV3gMmH211LqsBqE
	 Ol900zPCH3cD22f8UuzaAr6OLBtL1KJntSzucnsd1ocKIjZj50JNj+el0WDhMyEmhzplc
	 IOTum8BhN63lTT/acF+2lgqU9VgTA6abOXmQMAuoDKNXSuF7cW+Ye7E6aFO76QMndEHUG
	 ZzEIPlOOw/LMxK67m90m48Z2HZUdDhdqboO2UPa4F4IV8mYIst/squK2ZXuQVuLwwoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407447;
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
	bh=jC9GbGl3Mbs0h2d2ekv5svYE/nXCmkZ5SMkgR+QNuhM=;
	b=kBKWXCHMIxNyzeF9ZY8/cdDbWx0+9p/c3OBFfcqll78gq+psjo1Tn6q7Hk3qlTbv9o6g
	 MmcK5GEn7MvR18/zE1Cvj4zZptWBsI0r4NwEkXdA9cG++s7dOcUPiH77MGek4izJR5lw2
	 aPTjY4X3m/jfNZEGfahHdxvkCw6BQ80u4HQVfCg0dqCd/3N+ejdE6dPuvAnt64ANL6vcJ
	 Jt+pSvtKpILLNS0HIJFTCMK/ZATjueOSUIFfpNKzE3Q/nBd36nHQDnJ5AKKp7T+AGlTGG
	 ++bIKvSJgpOLz3BNBz5CIDFDrorHfPXRvJ7ZLka4w4sbqARTmTrvba4HAjEt3Wl89kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=J8sWZ4uQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.49
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8A606A327
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 14:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC8A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=J8sWZ4uQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIm0eYvMF6R5labAUgPeGvIUBgElsHeAjRc2NS7k0dTMmIaqcC4mGPKm5srJE0TGlX3x7aJr8Jsq2GVLscjEVRVV90jATV1dVzgs/RM/mL2c1hztxFx+Kgof7J5Z9N6YVnmvxFQDpnASkrClg9b7mklWYZNTL/SJDpfqXyEmjX0AuzJpLf8q+O9oC3O7xvBqOB/L25Wao3Xw7YZdKYs/ZyaFbkFMmADg6Sk8WwJiold6AMgxcVave6uVmlv6TawnACdsMH1nw6pIYD6EHqWKoCOx/Jaq26xE3pbkEpRQH5bFsXhG0oWIPP55SaoQ2nXbEbsyvYJCIB5nAxFcYmL12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jC9GbGl3Mbs0h2d2ekv5svYE/nXCmkZ5SMkgR+QNuhM=;
 b=cCRZ3UlGMqdR6my3E6SBzCfUqhmbaDcz8gZ6+6KzvEWtKi5bst6oPTLA8Rr6FFcMgJ6IQRYPJYcMiPfFBt5EwApbT3YKubjRYP+gRJkRH+JkjpzfcUkefWMle3q1D4JIjop+9aSyc5S5VIXDY3nJNIMuxamgod6feNEyZVuH9isEw6eUaWo5GtcJz+kzNgsj7kF8pu1fzhn0unSSK0s+Y9p9XUEsUkx2D72W+Na9vgE+MV2Tq6USdfVUzzw59Y9+fk5eURnOqbWAjDDO5aeAXWgVpku8J4ili6ejf+Lng/B7OkXsI1HPmAU7+glFIIiPlcJcGdHA+1+Of2QtakY/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jC9GbGl3Mbs0h2d2ekv5svYE/nXCmkZ5SMkgR+QNuhM=;
 b=J8sWZ4uQqHmnIEwxVD9JTK0rIGD8PB0+wh110yNSvRx4ZQ2Se6IIuwgfTo2KRidPBwVnL9IHLq/O7R7yNFjKiCmcW4wfNLckgPaZ2q2iBQkzWGepWsEGL48jsm90i2VuUaQaLq4ZeKtoL2lp1BuB6FqUu1HO3jZd4bal6R+do8Q=
Received: from AM0PR02CA0118.eurprd02.prod.outlook.com (2603:10a6:20b:28c::15)
 by DB8PR10MB3847.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Wed, 11 Nov
 2026 14:30:41 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:20b:28c:cafe::7) by AM0PR02CA0118.outlook.office365.com
 (2603:10a6:20b:28c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 14:30:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Wed, 11 Nov 2026 14:30:40 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id R9Axxf9kAf0UDR9LUxXAO0; Wed, 11 Nov 2026 15:30:40 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id R9LUxIkATbtn9R9LUxRTu5; Wed, 11 Nov 2026 15:30:40 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 2FE3418015C;
	Wed, 11 Nov 2026 15:30:40 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 2A2A9FE023B; Wed, 11 Nov 2026 15:30:40 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: jeff.johnson@oss.qualcomm.com,
	uwe.schnick@philips.com,
	Vishal Gupta <vishal.gupta_1@philips.com>
Subject: [PATCH v2] wifi: ath6kl: synchronize scan request completion
Date: Wed, 11 Nov 2026 15:30:37 +0100
Message-ID: <20261111143037.688461-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: AM7PEPF00000056:EE_|DB8PR10MB3847:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c92d2617-131c-4fe6-1a14-08df40005c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|261021121427099003|261022075727099003|261021135927099003|261022105027099003|261021123027099003|261026121527099003|10067099003|261026140227099003|56012099006|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qPgDOx39c/MqpJyLgdgJj22vqEla1UDYAbMm29QsNZLukChVWiyZ7TXIJVC0ovTD25rHYWNJwc03T1/Fkl6uEmwOGK26AagpgRn/XyEuVXj3MLZCGJ8DYcD+zTLvGlnIdJqqWfa1yo6FhSz8vJ3B7t1LrAvbK8RK+jIosanwjsWBHDhKB0C9mc/4eDb4RbPqIvN89ea/VZhfwPOvOqo/yebzP+0th2qSR5v6bNRMqQ0pSfAojXoqRwTciOpVtNSR4HjBtevnh3qiM/XYcwgcH2ZFQgAoBBKY+sFFU77glNNjn+p7IMLWPtTKtXsEV5jEVE/KjPl9T27LBJWo5VgnNcgWmjVSLyy7Hc0wiGAZbeW9gO6c2SVxg1R9+Kh2BJ34/dqUtGN+WFqWkk3rkNRquL/Ow8jXeXIOOKE/5BwEBIdYTS+H5GI9Un911YNxfsoXCPGCdQ4DSNI/iBZWNDePUXavgOenheFXslo7dy/OMGIsUq2v0MCx8UAfCw/b0dQlqQ7nXOkcrrY//LQVLIqd6ifmEU86eBN2mOH2ZBVab5zo8wwOJYkRr1AWvaQLUWEGPZv1q7ff8FaQJ/oVumI97gW8vx5Wc0/mrGjQZ/f5zrDGCoMfXZYjqqJ0VQi9+O8SW/rTHLzwcLhgfJCPmc34C58l8FNDMH+AF7OXuX62wrA=
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(261021121427099003)(261022075727099003)(261021135927099003)(261022105027099003)(261021123027099003)(261026121527099003)(10067099003)(261026140227099003)(56012099006)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pIt9Aaeufz+sYS9eHiUxs802mz3KfTPOb/ZzT10FW51c708wUMZ/uPBcNpJcad4NEWHb9ze4rE4vy2qFCoE+0OA4F2vCHJ8Ebk9ihaFUoK3vVT0M71KbsqEUQ3swFjblQC1mdHDTkdT1GcDGozTY5ITtHpap42RHOuuyRAIRjCXYfy644hsSEJxyq75NsLlIW96kgkeUwDNh7Dw7mGlSKXkiSN5OmiPBAyWtZftSDnDh6F0yGxktTLA76Fj9eHZLAi7YjYo5E3jC9yxRevZnpQsUTwor9mOJt7VGrMKSTGsJDAV0wPsBCqHtEb9Mu4RIxT2A0ryOTf73UmQW2bWZx6q3Fu3BtLTY9vK463ZIyUuQFCdukInYXUqONOn5cdIVXV1HmVKlK9PB6dz65HA5mz/vzsU8Lggk7sEcaDdFt5es6Vag/0w6GJ9M/VeNoto
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:30:40.5116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92d2617-131c-4fe6-1a14-08df40005c7a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3847

Protect vif->scan_req with a spinlock to serialize scan submission,
completion, disconnect, and interface-stop paths. This prevents scan
completion and abort handling from notifying cfg80211 more than once
or accessing a cleared scan request. Without synchronization, one
thread can set scan_req to NULL while another dereferences it, causing
a kernel panic.

Co-developed-by: Uwe Schnick <uwe.schnick@philips.com>
Signed-off-by: Uwe Schnick <uwe.schnick@philips.com>
Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
v1: https://lore.kernel.org/linux-wireless/20261026131631.1229744-1-vishal.gupta_1@philips.com/

Changes in v2:
- Fix subject prefix ("wifi: ")
- Add Co-developed-by for Uwe Schnick and fix Signed-off-by order
- Keep local variable declarations in reverse xmas tree order
- Drop redundant "req = NULL" stores after cfg80211_scan_done()
- Move scan_req_lock next to scan_req in struct ath6kl_vif

 drivers/net/wireless/ath/ath6kl/cfg80211.c | 44 ++++++++++++++++------
 drivers/net/wireless/ath/ath6kl/core.h     |  2 +
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
index c91560d559c51..4e620f8b6d69a 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -865,15 +865,20 @@ void ath6kl_cfg80211_disconnect_event(struct ath6kl_vif *vif, u8 reason,
 				      u8 *bssid, u8 assoc_resp_len,
 				      u8 *assoc_info, u16 proto_reason)
 {
+	struct cfg80211_scan_request *req;
 	struct ath6kl *ar = vif->ar;
 
-	if (vif->scan_req) {
+	spin_lock_bh(&vif->scan_req_lock);
+	req = vif->scan_req;
+	vif->scan_req = NULL;
+	spin_unlock_bh(&vif->scan_req_lock);
+
+	if (req) {
 		struct cfg80211_scan_info info = {
 			.aborted = true,
 		};
 
-		cfg80211_scan_done(vif->scan_req, &info);
-		vif->scan_req = NULL;
+		cfg80211_scan_done(req, &info);
 	}
 
 	if (vif->nw_type & ADHOC_NETWORK) {
@@ -1060,7 +1065,9 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
 	if (test_bit(CONNECTED, &vif->flags))
 		force_fg_scan = 1;
 
+	spin_lock_bh(&vif->scan_req_lock);
 	vif->scan_req = request;
+	spin_unlock_bh(&vif->scan_req_lock);
 
 	ret = ath6kl_wmi_beginscan_cmd(ar->wmi, vif->fw_vif_idx,
 				       WMI_LONG_SCAN, force_fg_scan,
@@ -1071,7 +1078,9 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
 				       request->rates);
 	if (ret) {
 		ath6kl_err("failed to start scan: %d\n", ret);
+		spin_lock_bh(&vif->scan_req_lock);
 		vif->scan_req = NULL;
+		spin_unlock_bh(&vif->scan_req_lock);
 	}
 
 	kfree(channels);
@@ -1081,23 +1090,29 @@ static int ath6kl_cfg80211_scan(struct wiphy *wiphy,
 
 void ath6kl_cfg80211_scan_complete_event(struct ath6kl_vif *vif, bool aborted)
 {
-	struct ath6kl *ar = vif->ar;
+	struct cfg80211_scan_request *req;
 	struct cfg80211_scan_info info = {
 		.aborted = aborted,
 	};
+	struct ath6kl *ar = vif->ar;
 	int i;
 
 	ath6kl_dbg(ATH6KL_DBG_WLAN_CFG, "%s: status%s\n", __func__,
 		   aborted ? " aborted" : "");
 
-	if (!vif->scan_req)
+	spin_lock_bh(&vif->scan_req_lock);
+	req = vif->scan_req;
+	vif->scan_req = NULL;
+	spin_unlock_bh(&vif->scan_req_lock);
+
+	if (!req)
 		return;
 
 	if (aborted)
 		goto out;
 
-	if (vif->scan_req->n_ssids && vif->scan_req->ssids[0].ssid_len) {
-		for (i = 0; i < vif->scan_req->n_ssids; i++) {
+	if (req->n_ssids && req->ssids[0].ssid_len) {
+		for (i = 0; i < req->n_ssids; i++) {
 			ath6kl_wmi_probedssid_cmd(ar->wmi, vif->fw_vif_idx,
 						  i, DISABLE_SSID_FLAG,
 						  0, NULL);
@@ -1105,8 +1120,7 @@ void ath6kl_cfg80211_scan_complete_event(struct ath6kl_vif *vif, bool aborted)
 	}
 
 out:
-	cfg80211_scan_done(vif->scan_req, &info);
-	vif->scan_req = NULL;
+	cfg80211_scan_done(req, &info);
 }
 
 void ath6kl_cfg80211_ch_switch_notify(struct ath6kl_vif *vif, int freq,
@@ -3601,6 +3615,7 @@ static int ath6kl_cfg80211_vif_init(struct ath6kl_vif *vif)
 
 	set_bit(WMM_ENABLED, &vif->flags);
 	spin_lock_init(&vif->if_lock);
+	spin_lock_init(&vif->scan_req_lock);
 
 	INIT_LIST_HEAD(&vif->mc_filter);
 
@@ -3609,6 +3624,7 @@ static int ath6kl_cfg80211_vif_init(struct ath6kl_vif *vif)
 
 void ath6kl_cfg80211_vif_stop(struct ath6kl_vif *vif, bool wmi_ready)
 {
+	struct cfg80211_scan_request *req;
 	static u8 bcast_mac[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	bool discon_issued;
 
@@ -3629,13 +3645,17 @@ void ath6kl_cfg80211_vif_stop(struct ath6kl_vif *vif, bool wmi_ready)
 						0, NULL, 0);
 	}
 
-	if (vif->scan_req) {
+	spin_lock_bh(&vif->scan_req_lock);
+	req = vif->scan_req;
+	vif->scan_req = NULL;
+	spin_unlock_bh(&vif->scan_req_lock);
+
+	if (req) {
 		struct cfg80211_scan_info info = {
 			.aborted = true,
 		};
 
-		cfg80211_scan_done(vif->scan_req, &info);
-		vif->scan_req = NULL;
+		cfg80211_scan_done(req, &info);
 	}
 
 	/* need to clean up enhanced bmiss detection fw state */
diff --git a/drivers/net/wireless/ath/ath6kl/core.h b/drivers/net/wireless/ath/ath6kl/core.h
index a0b236eeeab54..b8149abfe7893 100644
--- a/drivers/net/wireless/ath/ath6kl/core.h
+++ b/drivers/net/wireless/ath/ath6kl/core.h
@@ -629,6 +629,8 @@ struct ath6kl_vif {
 	struct timer_list disconnect_timer;
 	struct timer_list sched_scan_timer;
 
+	/* Protects scan_req */
+	spinlock_t scan_req_lock;
 	struct cfg80211_scan_request *scan_req;
 	enum sme_state sme_state;
 	int reconnect_flag;
-- 
2.43.0

