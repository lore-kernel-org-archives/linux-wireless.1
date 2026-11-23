Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441765;
	b=IsRCfCDFUFNVSUElV/XiOuso9RVFW10Ltv8rZxdLXDwODfl6Nxo2CQzOWPcpBdyb4WNc
	 oB8CZQORAUfg6HWtBA9LZE3lVZYyxpqdfc/TqMeAAPjY6ycP/QfGVtHkdUz3Jr8A1jmGl
	 u526gpzvVlIIgSjPDY2J+mlHnt2/14zE2DbhjtbUkKUYLWbuX4nZTTLDo2MFOhkU9osGV
	 WuI1GRjzMOZ1Q1cx8DwbSEdTA6oQtUtxYCqrXjLEvhX0uHRwdXatfSutBNEgicZSDUi7E
	 6VSqAdZDiKuGlaQBghMb/7dYIEn3ih9CQAL2l5GzqORxymjqrCM0bSfz+xeY0T8Df/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441765;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=33v42ijBrIjYW62iKDQzZ2TBPUnvhgAH5FKvhUxXsbg=;
	b=MbEO0l0TsJ6rOZJjcsQ3nJl1Bbu7I1P+0LhHci4N46qQElsYMALfdAKuPQfScVafeccV
	 uAUQY3daAX3O84OgwKevIr3KGJQ7QEqI1Gqgl3AeOQT3PqUJTZ4j4jdIbmqiWr6/x2S0I
	 TV9htKYgC0pFulGoKBOih6EdJXJDLP43ABO1TMFfvP3ys5m5kLGuwDUqkoKyJQEjReWFn
	 G6M9v/P/XHe14Yz+FMUJdibej0fn/WQlJU8+rD8NlbgCC7ICy0zSva8JhoPVsiy7edd0K
	 0gvRA2VwGhj8ORWuZ2uJJIzO2ZcKsT98IisylZfBsSkqFQYvHDb9/e89Qji+UZTwJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MjG1gFiX;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142D606A32E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9142D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=MjG1gFiX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=33v42ijBrIjYW62iKDQzZ2TBPUnvhgAH5FKvhUxXsbg=; b=MjG1gFiXQh0ZDMmRzfTGe+Y/YZ
	ixmRu/F+dTBcil+1XB1jzWxjen1jabyzsyfcMyLE7loTyCDAQDK2F5GivHBICqBPmUzuoklrrkJ3c
	Vxp7Ow1EDGKecoJYYmeXQmzEJ0YZZd2tXe9dF/WLBiFFRk1WRZnHAfpNOeJQN3Isx7tw=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ7-007NFk-0d
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:23 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/20] wifi: mt76: log the firmware status of a failed MCU command
Date: Mon, 23 Nov 2026 14:49:08 +0100
Message-ID: <20261123134920.154270-9-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7996 and the connac drivers turn a firmware status into an error
without a log line. The kernel log thus does not show which command
failed.

Log the command, its sequence number and the status, rate limited. Do
not log the WLAN failure status of the connac drivers. The firmware
also returns it for the deactivation of an inactive BSS.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  6 +++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 10 ++++++++--
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 1aa3380d8baf..3b4982660e61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -178,7 +178,8 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			return -EMSGSIZE;
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_uni_event *)skb->data;
-		ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
+		ret = mt76_connac_mcu_status_err(mdev, cmd, seq,
+						 le32_to_cpu(event->status));
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index cac47c8702e3..a39f90eeb1c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1961,7 +1961,7 @@ mt76_connac_mcu_get_wlan_idx(struct mt76_dev *dev, struct mt76_wcid *wcid,
 #define MT76_CONNAC_MCU_STATUS_WLAN_FAILURE	0xc0000001
 
 static inline int
-mt76_connac_mcu_status_err(u32 status)
+mt76_connac_mcu_status_err(struct mt76_dev *mdev, int cmd, int seq, u32 status)
 {
 	if (!status)
 		return 0;
@@ -1969,6 +1969,10 @@ mt76_connac_mcu_status_err(u32 status)
 	if (status == MT76_CONNAC_MCU_STATUS_WLAN_FAILURE)
 		return -ENOLINK;
 
+	dev_warn_ratelimited(mdev->dev,
+			     "Message %08x (seq %d) failed: firmware status 0x%x\n",
+			     cmd, seq, status);
+
 	return -EREMOTEIO;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index d973dea103db..77d3c07486cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -66,7 +66,8 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		if (mcu_cmd != event->cid)
 			ret = -EAGAIN;
 		else
-			ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
+			ret = mt76_connac_mcu_status_err(mdev, cmd, seq,
+							 le32_to_cpu(event->status));
 	} else if (cmd == MCU_CE_QUERY(REG_READ)) {
 		struct mt76_connac_mcu_reg_event *event;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5514a5284af4..6afeb326e901 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -81,7 +81,8 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		if (mcu_cmd != event->cid)
 			ret = -EAGAIN;
 		else
-			ret = mt76_connac_mcu_status_err(le32_to_cpu(event->status));
+			ret = mt76_connac_mcu_status_err(mdev, cmd, seq,
+							 le32_to_cpu(event->status));
 	} else {
 		skb_pull(skb, sizeof(*rxd));
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ef48cad39d5e..33aace532222 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -224,6 +224,7 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	struct mt7996_mcu_uni_event *event;
 	int mcu_cmd = FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
 	int ret = 0;
+	u32 status;
 
 	if (!skb) {
 		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
@@ -258,11 +259,16 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt7996_mcu_uni_event *)skb->data;
+		status = le32_to_cpu(event->status);
 		/* skip invalid event */
-		if (mcu_cmd != le16_to_cpu(event->cid))
+		if (mcu_cmd != le16_to_cpu(event->cid)) {
 			ret = -EAGAIN;
-		else if (le32_to_cpu(event->status))
+		} else if (status) {
+			dev_warn_ratelimited(mdev->dev,
+					     "Message %08x (seq %d) cid %04x failed: firmware status 0x%x\n",
+					     cmd, seq, mcu_cmd, status);
 			ret = -EREMOTEIO;
+		}
 	} else {
 		skb_pull(skb, sizeof(struct mt7996_mcu_rxd));
 	}
-- 
2.47.3

