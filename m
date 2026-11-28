Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868773;
	b=O4Fxld+ke5aUkZ/RqSn6V4XPAGwsfbiFNXl1l1WqpYYdEyfB/EGKclP0JS+pJ9M76Ceg
	 jgtlZEirJixmOHFsICom3ODFB1kZqomYZJRtu1FJBX7nO199hz2+ane9l0GD3Jbj61UbQ
	 OuowgAMHYeo1biDrYk6Ly+OXGPp3W1BUHTT49p9tMKnSnhaEjoysCjiUqqnyXzch/Xl+W
	 9DYgE3YJ0HlcynbzoLc6qCS+uXvonJJFJyx22scF45v4zCRYtfvDZN/DpIn7ePn2qrMFY
	 G9if8b9XUl6JFbEukMCLLHEy1LKpqrb+VDx+avXsL5tKOllkkEoP1ibOS+R8i4me73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
	b=BA7O6n4SdUwWTkQ2J0zdy0tvE+4FDT0rTtvV2/dYtUgLJZeOvNFb0dref+L8D8w3qgQn
	 HwpB/ygSIufZTiLFkaBYZQ2WI7ly1d/yCAhxABGtaTThMSqZM34La3OLJSlt0cavhBn/K
	 1tXgQ9gXyr80xG8c6zbQ3e2EfBtB4Wc2/J+GKWRifiupJFkaasy06ripoMngQrpni3XMi
	 V9wTx1nphcQ/M4K1tTsQV1Q++sXzLyzNtqQAotR6LWByTlrhG/DI46XU4YecUSZrllBzc
	 MDkKT4/5v11sRFQSRFV+1iuuN8Im/ntDYeXb1RO3mNLi6UzFYuuxKe6hDF8qBD48d5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPyhgWPk;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5137606A321
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 12:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5137606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPyhgWPk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso82741855e9.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795868771; x=1796473571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=kPyhgWPkQ9sTZ0JH8L52QCk3CAnZz5sDwQCkRQfALxoNdwNlp/gsg4yFcghQbnkUbK
         88T1vD6mrTf9EbBwnFYG09Bmd1OQPCulXwk21zxxgdmVN/xdOhWGAFWOkj0s3xw4IHYQ
         2vgQITeMx8AVuK2aK5W631ktNZ4vplqZGJCCNq+eHYnv62/gNRmy0bqOISUuPaeBg7Qq
         e5s3kHdD/oghWLYBddYpgplHkr9hIJT6wgZtOvQNx8BtxduMpIxXJn/tlJ9LowSVVAKd
         uRQAGU3vie2nKgdSOo9LGD1oRPSD1keHg4P48hJ7NWQ7K096n0h9ah+EMGmosG4MKOlL
         mURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795868771; x=1796473571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yom6P11rX/hdhy2NNJS3Jns2I9Z56P2y3ixdK/nEUpo=;
        b=wxwSq88Vv0GSH8/UvXRGK7QO8YQ87LkrcG6Zapar92mTH9GcF1xkjyEA9gnS3x8ruY
         9GqY7ZHKOGnmpoJ+NCzQsQ4BDhmHOSEjyRnkB9jw8hap+8I54CPDzoWR4QiufdbCnow4
         CL9NsX1A8gv58iuoxDfvRqyMCq9gpm68VPV44ZetTuduGvLO37fQFsorZ2kK4zwkhNOc
         ZoCyApUwf1L2p3yNqsKEfMF42TTGUA8O2r2Y43MibyqG1qnqkmy8HglsMX63vpkPNsA9
         bBEkHIqeXN1yGSCLWU/isW5SGlyBthnmGm5xRUoXIHIBjy37QPYqFjoy+NlZ001mC6JX
         8pCA==
X-Forwarded-Encrypted: i=1; AL+hErGpfpgjw9Paj0uRJnZkBVhM9BRs9/+Q7Ar9U/qj5SqLvPzzP1ZvyfzTrMFa1Jgc4M8BC8CRv6uvyMfb648IkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UYUJv06HQF7KOVun3kYRescqCl7ZBUa6KAgaQqwtwMeG+r/9W
	oQYi3b2M2jOMR1dMf6YUjXnP8liEg+hbjzXSBcJS7hTfdwx512z68gDb
X-Gm-Gg: AZFdTZfz040itMAVFr6IL5KBs7jwOuBYwUGYf4T+zLvTUKcvCB4iwhy0K8EYZRpY38k
	O9ctC2D0Bimwo+gxi5o1tJQjW+37IdJV3yDh6ruY76qKYvl2mrrLPo5TWS+wmzSNw2JXfxtLHQ/
	Q8G2S+v4mq7/OwDLoeba+YUZr2If4BotM+Ri+jeHSE++UR2FLQJybCQ/xEzgWRuL+9ZYvpE5MPv
	Rzb08kUSgnJnI43xvesOprlJ4JtrgpZpbaLABZomimUKuWFLm6NKoLy2nPfeX4IyWtOaZFPAT14
	B0WlmqyC+JVIMdfC2nN516u8Q6jhpxKLnZJoWxT3NSqCaGHq1LwMU5CLKPVUGIvFBJv1lpgCszG
	P7b/w4RTQdKjIbgXMMqovD2cRER+w8FXdTrQEtjPGZiu3vuwuIWsYcr2X6x9Ng7KJMlb+EWbUDu
	XS8jyyuqmBum4SzHuGdNYLngC0lNNeB4uGOe4G4ngCKIcpnesQcRFw81gIogrON/9cdBwfSmjBZ
	PI3sjuDmBSt+puukNZYw0prU6wnOgRM6h99rbOkQUHoLw4r15sqOa3KI1YfwC4m1XP217c2t/r0
	il3tZHkR+T3AqtCRlTunapbP6LmQUf+xSc/mvRUQHNNHtiQnWmXI+8ZYqK9WwCoKNiQ+bWKG+Q=
	=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr553027325e9.0.1795868770988;
        Sat, 28 Nov 2026 04:26:10 -0800 (PST)
Received: from kidala-computer.. (ip-109-41-112-86.web.vodafone.de. [109.41.112.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm502815995e9.2.2026.11.28.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:26:09 -0800 (PST)
From: Oleh Shcherba <scherbaoleg4@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Oleh Shcherba <scherbaoleg4@gmail.com>
Subject: [PATCH] wifi: mt76: do not mask negative MCU command ids
Date: Sat, 28 Nov 2026 13:25:41 +0100
Message-ID: <20261128122541.6670-1-scherbaoleg4@gmail.com>
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

Commit 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
clears BIT(30) of every command id before it reaches the driver. mt7603
sends its legacy commands as negative ids, and a small negative int has
bit 30 set by its sign. Clearing it turns -MCU_CMD_FW_SCATTER (0xffffff12)
into 0xbfffff12, so mt7603_mcu_skb_send_msg() no longer matches it and
queues the firmware image to MCU_PORT_QUEUE instead of MCU_PORT_QUEUE_FW.
The firmware never starts and probe fails:

  mt76_wmac 10300000.wmac: Timeout waiting for firmware to initialize
  mt76_wmac 10300000.wmac: probe with driver mt76_wmac failed with error -5

Only handle the READ flag of non-negative command ids.

Fixes: 1ffc90633ad6 ("wifi: mt76: mark an MCU command that only reads")
Signed-off-by: Oleh Shcherba <scherbaoleg4@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c  | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 4f3471b..4dc287e 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -59,7 +59,7 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 	struct sk_buff *skb;
 
 	if (dev->mcu_ops->mcu_send_msg)
-		return dev->mcu_ops->mcu_send_msg(dev, cmd & ~MT76_MCU_CMD_READ,
+		return dev->mcu_ops->mcu_send_msg(dev, mt76_mcu_cmd_strip(cmd),
 						  data, len, wait_resp);
 
 	skb = mt76_mcu_msg_alloc(dev, data, len);
@@ -74,14 +74,14 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 				  int cmd, bool wait_resp,
 				  struct sk_buff **ret_skb)
 {
-	bool read = cmd & MT76_MCU_CMD_READ;
+	bool read = cmd >= 0 && (cmd & MT76_MCU_CMD_READ);
 	unsigned int retry = 0;
 	struct sk_buff *orig_skb = NULL;
 	unsigned long expires;
 	bool lost = false;
 	int ret, seq;
 
-	cmd &= ~MT76_MCU_CMD_READ;
+	cmd = mt76_mcu_cmd_strip(cmd);
 
 	if (ret_skb)
 		*ret_skb = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d635df2..237057c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -272,6 +272,12 @@ struct mt76_queue {
  */
 #define MT76_MCU_CMD_READ	BIT(30)
 
+/* mt7603 uses negative command ids, do not mask them */
+static inline int mt76_mcu_cmd_strip(int cmd)
+{
+	return cmd < 0 ? cmd : cmd & ~MT76_MCU_CMD_READ;
+}
+
 struct mt76_mcu_ops {
 	unsigned int max_retry;
 	u32 headroom;
-- 
2.43.0

