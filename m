Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509793;
	b=DWCwtRIX+erWrGLUpLlA2htTc+d5v4qMziqieZKtawTkPr+zhCowRmhVAj4qTqvzxtIB
	 JuX5PLq9uX4AAmdfW9iqA67veoEq43clPtJWUjNfEKuEZiBEhmlAtriiI4ArsOarqfIKG
	 IVEffKPiZyCQ4c1/xnzakjiKB2bOp5MzxBefVoBpNHvI8LLHdzoreKecBttVTYwfapAh8
	 W3L7HYwObrTp206qsp3dk7SJ86Jp9B8M+PM5++fTbel6zjvwlbzZnnUBY41bkMj9njBRP
	 U75m0NuGwYae8SVuferk2/2pYKV9lJhFmaJi7VdH0blZnwsOSBALvAEHz3/F8jo9yJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509793;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zH/L0uRBxA0wwRoFGMMYuyp1eX7CAFHl5mFlcjqfDw4=;
	b=GE0Piq3CX/eYCFIc77tHL+kZyQKtDMoTQnVJVUBuy9y7MlPBhcjmgoeR9oXjZ4Xvs1CW
	 O9ohTw3wCA9XAJaUaGAEfwxn7BtroI8J10zIbuzHo5hO5/zIl+/aUA8vbzIL1dJ2yZNcN
	 QiC6UjLvH6Cl3/eeAk8SE4Dx2CRUUQykV4pvIgvXC6Kp3TLXku4+WDN+pjH4qMc16nmXI
	 FrHSMJiY+Qgdm8y7MnY3sH+otAN7AJweFfCoJC/T4P/Um1jss6mJ/E5MHRmZkp/8xPCki
	 2alNT5VxJEP3xYp+Q3fcCwBjKWWyOJrMSh3Ovs+G790PI36plE7JlXlrzC2Foz8sTPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Pf4N7sWO;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD61606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD61606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Pf4N7sWO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zH/L0uRBxA0wwRoFGMMYuyp1eX7CAFHl5mFlcjqfDw4=; b=Pf4N7sWOyfnIPv6WRu123LUC/a
	tHXVkQg92GvAC2lHYcb9sc8Ytq5AI+mrwxMU4YLQtIsl1k/EG/Hwt2QQqDKMToid6AwhSX3XDx3YC
	cKVSvZCBPa5V41Yvp7V842lGRMgfdxCjAmehIOU2fXPWOA6BGM4BnwiigxnGMWmN5wUo=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7M-007dJf-0S
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 06/20] wifi: mt76: report an MCU command whose outcome is unknown
Date: Tue, 24 Nov 2026 09:42:55 +0100
Message-ID: <20261124084309.1981968-6-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

A command that an MCU reset keeps from the firmware is not applied. A
command whose answer does not come may have run or not. In both cases
the firmware state that the command was to set is not known to hold.
Only the driver knows how to restore it.

Add an optional op that the core calls for such a command, unless the
command is marked as a read. The core calls it after the response
parser, with the MCU mutex held. An answer with an error status does
not reach the op, and neither does a host error before the send. The
firmware state is known in both cases.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt76.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 61b8ced5c11a..4f3471b57eb9 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -78,6 +78,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	unsigned int retry = 0;
 	struct sk_buff *orig_skb = NULL;
 	unsigned long expires;
+	bool lost = false;
 	int ret, seq;
 
 	cmd &= ~MT76_MCU_CMD_READ;
@@ -125,6 +126,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 
 	do {
 		skb = mt76_mcu_get_response(dev, expires);
+		lost = !skb;
 		if (!skb && read &&
 		    !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
 		    orig_skb && retry++ < dev->mcu_ops->max_retry) {
@@ -143,6 +145,10 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 
 
 out:
+	if (!read && (lost || ret == -ESHUTDOWN) &&
+	    dev->mcu_ops->mcu_cmd_lost)
+		dev->mcu_ops->mcu_cmd_lost(dev, cmd);
+
 	dev_kfree_skb(orig_skb);
 	mutex_unlock(&dev->mcu.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 5cb446bdf4be..688039f2d967 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -285,6 +285,7 @@ struct mt76_mcu_ops {
 				int cmd, int *seq);
 	int (*mcu_parse_response)(struct mt76_dev *dev, int cmd,
 				  struct sk_buff *skb, int seq);
+	void (*mcu_cmd_lost)(struct mt76_dev *dev, int cmd);
 	u32 (*mcu_rr)(struct mt76_dev *dev, u32 offset);
 	void (*mcu_wr)(struct mt76_dev *dev, u32 offset, u32 val);
 	int (*mcu_wr_rp)(struct mt76_dev *dev, u32 base,
-- 
2.47.3

