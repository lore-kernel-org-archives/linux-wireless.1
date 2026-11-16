Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871099;
	b=sc+I3Z8MeVRC0sAuRAham6MBQj/e6Ly+BBGyp0pyKOLUEUFaotEYafFyrPxnsVs3szTM
	 3VStzf/forKzti6ik7PutQifsF7U4VmG1JmwIeZKhZruqQZUL7tTyT/bJlN0Oiv7ILuVL
	 gMod/F7cTT2TVOG4UE9iTY2Y0G/BxaEMGpjxhYJp6y+oi4mPdUsGfposrAeKkMMcLj/UG
	 mfXgFnq7GnNhoUn6tkLdoNmc+ITSq0PAF4N7iUBFIkysfMf6jRWZO2NtvPQNnAIZeuHtg
	 4NsRsR0y33Q0LynSYgSmx90JX5ZGrJsc4FPAGX/GFZelO5s6LhbBF/Qpq1BImFAHsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871099;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d565s4DphSSG/c4wOqcYcK8O2xYx/fApraOeU5LZFRQ=;
	b=h0/3z5R7EOlZXNcTGyZq65X471jPTP9pXNVmXVLE/haSZCRRf7AOD0aAqYfcZX425NyS
	 AD6zEZmEudu58mZkRHTD1Y8ve3z1W68m0BIo5Q2M89GPZTAH+h1NTNrRmYjklFSwEA8HX
	 SP4AK8JtbD1O8csNkMIUJFxGTFC6usFgh4FqDr1RvyYjVig9eOXNPR/whYCqAqnOyHnSb
	 78/9GzusPH8FE1bRxn/uexlQ1L8cZNsFOowBzW77eAA/twbUYJbZUBXaeKOmMdr5v1OkD
	 hZdINXApZ0Z5DLR2gzopVYOM20lJm4jiiFeiVtK2gYD0oiYitsmXVPz9c+2k3UgAAHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B8A606A332
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B8A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dbe9b8d6eso276220b6e.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871098; x=1795475898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d565s4DphSSG/c4wOqcYcK8O2xYx/fApraOeU5LZFRQ=;
        b=qxGZ65TWsdOlFTbe+PcO/QpUBLu2qqQh3AW1bj7gAMQMHyRxk6hxl8ElvI4ynJ7xNF
         yJfHDA8tP1lAkbdUq3pmsJd/9vHjpMOpv8C01e5Oi+h1p2Xdif0BnCZ+JD8wbwbtS/SI
         rOzGpPVa34JotUSOaNhAoRDVIPtWS7HRCUKYFE5ko1gDOmFGJf1G95TwH8uuxq+0C7IP
         apa7mEfRoSEuq6LDXpz2stdd5yxx9UOxeRYsGHGWB8bQGSpl5ARQqZcstK+5kN0Zse2D
         4Yr5wLWXqicytmLobwheojbn68q14EVhv/x9q0oi3kOpoE2/b23BFBTD5bq04+iMlakX
         VFHQ==
X-Forwarded-Encrypted: i=1; AL+hErFwJU50xaPCH20nfZI5Ak1kocy0n2Le9m15AQI8L9kQHukXTzncdvEKe3kUK4qMiyHFJME8KP/zFjcLjPWRHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gJwM/cUA6g1tCiJdlwWoUMeo0hpgMMUehyd5W91FKDCKDMc9m
	cw3sQQgBn+TP3gU2R7HnJP2kO3V2nkLTsQs5fZAM2kfkSHvPhvW2B9M/
X-Gm-Gg: AYBFou0Hj/MdZVuW1IY5IUW5RVaVG69B9nWbLnt77M+huLDsHVlL1rCxzLdrpFeDKp4
	KI/9Nt0xa8MDDiFqOKiK0b8LeroImAf4Dh1yPhRhEHSFPKjRoZ6bKb1ZoNtsiGrMoQqaPnCklZL
	A+mi1YzFIe/SeVfcwwiODNe/BglwnfqfGQsmKukxQ7N4tHcQVd76OEI4nYjRO/Cx16PvrFAP8Ip
	zJpQZ3vL1mCShR4b4OX7F56ExY/QfKieLRe/XupQGj5bMjzAe3auW2SMulUd4U6nkj1BEhoK+U1
	wfix3KMq4BOn2ojLxVSEnQNX4sjslPKdJ0RMWz+tHn1fWZ2ZbJLNVjlMRJHoed1/VKJDmn+zl9Y
	cJGKFqQl+EFUjsXptjGB67+RkQpCLuLWx6qlL2BTGvYmvduMDaoUI9Ef6NoM8GqT873RUaf6Z8m
	GQFRi2A6yiVrzWBS2CjwxTE/yokjeuqvLItZlNi0QKFyL/eg5zt+TTD6A+XhZ8pM8TNavCj7HBJ
	bIq5vaIm4ik7l7KgnhwBKDLWEpKy3CUOehG3kSyiGpEv5yVjMWm4epedaAAefWtmjgt33IHqZbO
	WVgY5/R1wgMptnk1M/K7cvYtuvgYTMuoj1nB17cj7jKHG4qpC8l583IfK8qjzHBmNwDYIAEd+Il
	VDho2I4Gy
X-Received: by 2002:a05:6808:3013:b0:4f0:2d60:f0f4 with SMTP id 5614622812f47-575dd7262aemr835835b6e.17.1794871097429;
        Mon, 16 Nov 2026 15:18:17 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:15 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 01/19] wifi: mt76: mt7925: add NAN low power event control on suspend/resume
Date: Mon, 16 Nov 2026 17:16:12 -0600
Message-ID: <20261116231630.1733906-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

Disable NAN low power event reporting when the interface suspends so
the firmware stops firing peer-schedule notifications into a quiesced
system, and re-enable it on resume.

Re-enabling is conditional: it only fires if firmware has previously
reported an active peer schedule (non-zero peer_sch_record_tx_map in
the LOWPOWER_CTRL event). This avoids sending the command on every
resume when no peer connection is in progress.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  9 ++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 93 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 18 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  7 ++
 4 files changed, 127 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d3806d8dfbbf..c800ec2f25dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -324,6 +324,7 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	bool suspend = !test_bit(MT76_STATE_RUNNING, &phy->state);
 	struct ieee80211_hw *hw = phy->hw;
 	struct cfg80211_wowlan *wowlan = hw->wiphy->wowlan_config;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	int i;
 
 	mt76_connac_mcu_set_gtk_rekey(phy->dev, vif, suspend);
@@ -343,6 +344,14 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	    !vif->cfg.assoc && !wowlan->nd_config)
 		return;
 	mt7925_connac_mcu_set_wow_ctrl(phy, vif, suspend, wowlan);
+
+	/*
+	 * Disable NAN low power event reporting while suspended, and
+	 * re-enable it on resume so firmware resumes reporting peer
+	 * schedule activity.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN)
+		mt7925_nan_send_lowpower_ctrl_cmd(dev, !suspend);
 }
 
 #endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index ce2571832c08..39d56519bce4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -651,6 +651,44 @@ mt7925_nan_handle_sched_update_done(struct mt792x_dev *dev, struct tlv *tlv)
 	ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 }
 
+static void
+mt7925_nan_handle_lowpower_ctrl(struct mt792x_dev *dev, struct tlv *tlv)
+{
+	struct mt7925_nan_lowpower_ctrl_evt *evt;
+	struct mt792x_vif *mvif;
+	u16 len;
+
+	if (!dev || !tlv)
+		return;
+
+	len = le16_to_cpu(tlv->len);
+	if (len < sizeof(*tlv) + sizeof(*evt)) {
+		dev_warn(dev->mt76.dev,
+			 "nan: short lowpower_ctrl event tlv len=%u\n", len);
+		return;
+	}
+
+	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif))
+		return;
+
+	evt = (struct mt7925_nan_lowpower_ctrl_evt *)tlv->data;
+
+	dev_dbg(dev->mt76.dev,
+		"nan: lowpower_ctrl event - peer_sch_record_tx_map=0x%x\n",
+		evt->peer_sch_record_tx_map);
+
+	if (!evt->peer_sch_record_tx_map)
+		return;
+
+	/*
+	 * Firmware reports an active peer schedule; remember it so the
+	 * next resume re-enables low power event reporting instead of
+	 * sending the command unconditionally every suspend/resume cycle.
+	 */
+	mvif = (struct mt792x_vif *)dev->nan_vif->drv_priv;
+	mvif->nan.lowpower_mode = true;
+}
+
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct tlv *tlv;
@@ -685,6 +723,9 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE:
 			mt7925_nan_handle_sched_update_done(dev, tlv);
 			break;
+		case NAN_UNI_EVENT_LOWPOWER_CTRL:
+			mt7925_nan_handle_lowpower_ctrl(dev, tlv);
+			break;
 		default:
 			break;
 		}
@@ -694,6 +735,58 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 }
 
+int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable)
+{
+	struct mt7925_nan_lowpower_ctrl_tlv *lp_tlv;
+	struct mt7925_nan_common_hdr *hdr;
+	struct mt792x_vif *mvif;
+	struct mt76_dev *mdev;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+
+	if (!dev)
+		return -EINVAL;
+
+	/*
+	 * Only re-enabling (on resume) is gated on firmware having reported
+	 * an active peer schedule while suspended; disabling (on suspend)
+	 * always goes through so firmware stops reporting immediately.
+	 */
+	if (enable) {
+		if (!dev->nan_vif)
+			return 0;
+
+		mvif = (struct mt792x_vif *)dev->nan_vif->drv_priv;
+		if (!mvif->nan.lowpower_mode)
+			return 0;
+
+		mvif->nan.lowpower_mode = false;
+	}
+
+	mdev = &dev->mt76;
+
+	skb = mt76_mcu_msg_alloc(mdev, NULL,
+				 sizeof(struct mt7925_nan_common_hdr) +
+				 sizeof(struct mt7925_nan_lowpower_ctrl_tlv));
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct mt7925_nan_common_hdr *)skb_put(skb, sizeof(*hdr));
+	memset(hdr, 0, sizeof(*hdr));
+
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_LOWPOWER_CTRL,
+				      sizeof(struct mt7925_nan_lowpower_ctrl_tlv));
+	if (!tlv) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+
+	lp_tlv = (struct mt7925_nan_lowpower_ctrl_tlv *)tlv;
+	lp_tlv->enabled = enable ? 1 : 0;
+
+	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+}
+
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 9a0cd1d06d45..6979f0347d77 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -89,6 +89,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_UPDATE_PEER_CAPABILITY	= 21,
 	NAN_UNI_CMD_CHANGE_NMI_ADDRESS		= 24,
 	NAN_UNI_CMD_SET_DW_INTERVAL		= 26,
+	NAN_UNI_CMD_LOWPOWER_CTRL		= 37,
 	NAN_UNI_CMD_SET_SYNC_RSSI		= 39,
 	NAN_UNI_CMD_SET_CLUSTER_ID		= 40,
 	NAN_UNI_CMD_KEY_MANAGEMENT		= 53,
@@ -96,6 +97,7 @@ enum nan_uni_cmd_tag {
 
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
+	NAN_UNI_EVENT_LOWPOWER_CTRL		= 37,
 	NAN_UNI_EVENT_ID_ULW_UPDATE		= 39,
 	NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE	= 43,
 	NAN_UNI_EVENT_REPORT_DW_START		= 59,
@@ -477,6 +479,20 @@ struct mt7925_nan_update_phy_setting_tlv {
 	struct mt7925_nan_phy_setting phy_5g;
 } __packed __aligned(4);
 
+/* NAN Low Power Control Command */
+struct mt7925_nan_lowpower_ctrl_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 enabled;
+	u8 reserved[3];
+} __packed __aligned(4);
+
+/* NAN Low Power Control Event */
+struct mt7925_nan_lowpower_ctrl_evt {
+	u8 peer_sch_record_tx_map;
+	u8 reserved[7];
+} __packed __aligned(4);
+
 int mt7925_nan_update_phy_setting(struct mt792x_dev *dev);
 
 struct ieee80211_chanctx_conf *
@@ -496,6 +512,8 @@ int mt7925_nan_change_configure(struct ieee80211_vif *vif,
 
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
+int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4753ec20fe0c..cc6eb1562b5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -188,6 +188,13 @@ struct mt792x_nan {
 
 	/* Connection index bitmap, up to NAN_MAX_CONN_CFG peers */
 	unsigned long conn_bitmap;
+
+	/*
+	 * Set when firmware reports an active peer schedule via
+	 * NAN_UNI_EVENT_LOWPOWER_CTRL; cleared once the re-enable command
+	 * has been sent on resume.
+	 */
+	bool lowpower_mode;
 };
 
 struct mt792x_vif {
-- 
2.43.0

