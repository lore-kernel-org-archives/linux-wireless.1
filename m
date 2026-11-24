Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=p5pLiuMfN0Clov9yNIIaHLLG1AFGVhQbqN2mqKV3bVs2BVdVwWhDT/ywDmPZr/ESRruf
	 GBH5y8nMSlpsmJDqzbB+W5T6k63HZyNFbo1cINnE2Q2Io3GhKyuSel0TrF5W8acUja+Vz
	 z2vZzmUBrIMD9/wQtC9uwCoRawKdKFq1GAyc1upBcQiIlVTtomFR7ALFpJNuqanttWwUQ
	 Kz1QtmeyRgBy7PVN1pNyliWjK2UrIs5tmf9FEugblMLLFs2tePJWy5TiZ2b1j0VQBacVP
	 mZI1Gzp2Oa1w3/40n5En/vrK0ilmmKvU0GCHXcmioPWKFJoCowubCfDNR+FbADhg53A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q3CEGv7G0S1nV4hnZ9kXmeoO2DPi9o2ZVdxQ7MZMIgs=;
	b=ft8lk3ziYbcG41rtuZF9n7Sc740IAW2atvAQNQUeP+Irf4vanwRpTOd/10cAtLmBrrKC
	 Rzl8nqwMAhrdfiFIeQAwzC/bgXQ9sMKcN/H02ktd/kCVoTX1924Uh7OIIcIn7Lw5DCv4L
	 +gJeHc+yPKl+8fXr7EJaIt09vY/59KR9Y25m2insysqBRQvabywBtRCTSlDBpqoltVbXl
	 aTIL+engDPqRddl5TQ1krpqr9Xkkia0AkktZUXYqBuGbkVmJPkMvuNpgDSSjdJgY4KhzH
	 dDMMDeFIUCr9/dbUxiY/yiD1xHR12UGnwQn7b9wttr5JiGon88MBAhZys3msOOR7a3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tv8WvpON;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AC606A322
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489AC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=tv8WvpON
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=q3CEGv7G0S1nV4hnZ9kXmeoO2DPi9o2ZVdxQ7MZMIgs=; b=tv8WvpONcKb6Wy3fGR9A62+2PC
	TZiEMrro1cWnn8yS1LYWnqJIed5FEiTtWHt5M3VVqsGL9tB7iDpiZst23PIwIQif4iujhu8pVKe2x
	XWCOMBqTqbzeQVuAvHCQp/OoUhSd4P8jKAiqnLdhgMzlATC3UXZjRGrV/4csAcG7Lg/8=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7L-007dJf-2Z
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 04/20] wifi: mt76: mark an MCU command that only reads
Date: Tue, 24 Nov 2026 09:42:53 +0100
Message-ID: <20261124084309.1981968-4-nbd@nbd.name>
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

The core cannot tell a command that only reads firmware state from one
that changes it. The query bit of the command id does not show it.
Several reads are sent without that bit, and a command that returns
data can still change state.

Add a cmd flag for a command that changes no firmware state. The core
can then handle a lost answer of such a command on its own. The core
strips the flag before any mcu_ops call. A driver compare of the
command id thus needs no mask.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt76.h | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index e19fd1bbd911..0a7d82bdeeeb 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -59,7 +59,8 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 	struct sk_buff *skb;
 
 	if (dev->mcu_ops->mcu_send_msg)
-		return dev->mcu_ops->mcu_send_msg(dev, cmd, data, len, wait_resp);
+		return dev->mcu_ops->mcu_send_msg(dev, cmd & ~MT76_MCU_CMD_READ,
+						  data, len, wait_resp);
 
 	skb = mt76_mcu_msg_alloc(dev, data, len);
 	if (!skb)
@@ -78,6 +79,8 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	unsigned long expires;
 	int ret, seq;
 
+	cmd &= ~MT76_MCU_CMD_READ;
+
 	if (ret_skb)
 		*ret_skb = NULL;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 648f79c4b6d0..5cb446bdf4be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -267,6 +267,11 @@ struct mt76_queue {
 	struct page_pool *page_pool;
 };
 
+/* cmd flag of a command that changes no firmware state; the core strips it
+ * before it calls an mcu_ops function
+ */
+#define MT76_MCU_CMD_READ	BIT(30)
+
 struct mt76_mcu_ops {
 	unsigned int max_retry;
 	u32 headroom;
-- 
2.47.3

