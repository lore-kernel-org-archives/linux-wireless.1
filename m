Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434346;
	b=eO+YErtl1YBuXlU1HNB7ucbYM7LqpSJl3a7IrK0pcnqklpf1qg3AgT2+grwU2MrldIdM
	 spgkwQ4EbP7LC94yk5kN3vd9VJrGG8xAACt3KT88JtkUzE3xfMMNyH2N4zTUo9FYOmOT4
	 uxU3EUBPAetR3apMMdugZT04M7Rh08VPT6EB445HhXTZ7e/ZAGrYwtdfwQpFwvwJ0lfes
	 nmKv2xUWuayrrOQk2L+hkyVd6OjhlsCx94uHfzZJqbI+2Ftjvke3fHR66hGF9C4h0dDkj
	 aiQrbTVkA5AghsXACC8wNpGyulCzLNanNADNyFTXq0y47u/rhybWhe129GLt3IRVInQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
	b=3djGuf21d1jK8X8X/U+J+ZimKivAFyyzUYzzbxVX84ikodRdGpGF+jjyUpdFMOjLEl3L
	 TIUIfDDbrJ9KKHfambNVkLMHBwvOHAiQ5buK3g0bp0JXOR/oD8Fc5dSjEgq9Y2FOqPWGs
	 w1VrYzxFL8OhyGLVLmEYl6Ioft9ksz2bd2KNkMdb+sjI3Pfc+Odzr4jPeiQ6WZq4uLycp
	 2DUM58oxsKxqVr31lt9FIetO08lTlmgN5q5+TPfBUdDSYbVYjq7IUK71pWhE98yf0NYCw
	 yJdutvirXN90bTvNCqKyi1V22YCZFIF5L2C2puxxkkd49MlKz3GHGq+bTkrpE1BgwnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljWddJXX;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77960A3828
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F77960A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljWddJXX
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f20c3aaa5so317162685a.2
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434345; x=1795039145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
        b=ljWddJXXf7IkHnl5xJb3WO0J4LpldKi3Xnh4EhXaxlUFHO2ERWKLBCSVk2p4hSy4CN
         8/GQZ+pIcpeY83ng0rxo0eEqe0KAnkIrv4x7VrfJTo+0NG/lHAxSAAmRKzU0odKoMw+s
         3CsRVGsjVbFDPTO7ueud44u2e5iagk9ozpsnMxCipcUWZj6jfegEtJvulQivOCjwYDWF
         dp+4WDUTOb3VE+WpBxTUCjLjE28jqnahNM3v88Fx6L9ilMsz4MsbGR307JjXaweHGD/G
         SCi5kIdhWoA5rMNZkkVXP13LIgmls8EeZIqX4+UWaPLTwHm659PZPsKvret0JlZFgvhk
         kchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434345; x=1795039145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
        b=OaYXOjCtJuRoUmMpDypyeU1rVr4tviqEXD3DO4FG9qRRoTLkvo7ZmBjiS2zIOGWBeO
         Da6/WaPE/Lyh3plmj/0WHD+9WBU0zynDdLKFzU6n5O59KQpRJPuA+wt+z4/CER4uMoVY
         10SQkDGecnYst/qtCp3qKuL2GATOn7LcvGLZVgX2ZLiGtvI9MDL93i30QxQlHuwE7fk3
         BqpCdncVQjuYDEpqNC1jXiW4xdbadBUkLb9omyPxks0ilttwOeCh3ZiwA2Z8Mu61QRE1
         XHrt5JnuDpOLxnGo9dSxKts/voGUeYZTXMiF1Qbd9fGMRKCmEJTAxd6RFWja13D+JI9C
         1iRw==
X-Forwarded-Encrypted: i=1; AL+hErHOKEcs3XXg0cWJJ3qrmjL3T+SOOPGj4rpNj6s9mkJqfUA83/xi+Rum6HBZM9RnuySnbXFsaXnD47AwUXkauw==@vger.kernel.org
X-Gm-Message-State: APuU4Z93OdxLXFtQpXL9GafiSUg1h5URhvGEnXzGbOaoAVRMB0kXDqPQ
	BZdGGZwmcFw9/8mplKhuBjkKzyL98sygnrfVqrY0ccUoBJaX1GC8b9l9
X-Gm-Gg: AYBFou1xM19X71ED+w5yCuEj5bggznpv2/hzOGQBuJt1wVFymeEADO/Tfsybnb7B1sh
	f84JN74MfBOMc4/LS5BbHgJ4jfm442OZanP/SLQoS4OhZnaGYap+qN/zXcicGvRK3CQZWOL18wK
	D7EFqbAE7lmnGf0VfitFaLGhTmW6MWMccTV2PeZrwJULsA8zRPTaDzz3iBkH/w4VQbNDyRWlYFq
	Xwv2i2NCvArLZd/cRGqhr1CfEg3s6wfnT6CKcOymkyVScJnpdcSrlCvF7/1cIsZqvxESvaQWurp
	fVm/g/GBFu5GNC6R39rksZv5G339xT9UJkcEN+LhbvSlWNzMvfpF94+7O7y9GUUCP1zcMNK1jvl
	YP1moUL1qqRRvPuX3mUR0YkzHUZkRDIY6ggDHHnyg5qVGnYXPYpQy3SvrmIAKSXMjhGcE1Q0N4V
	Jh/hdOIK06G2LZkzoOLhrUSJxOr1NgGpCPr7IgoSbt39SC5cAeoKeHNf1dZB6aCMUQS1bddeZOB
	QrPwCl+4acs1RmOiZJ6SDpx9ipSX360rhcqDCNCxfeLRQmvtHoCNrxsFZxiDSxenS9QDn5mmqUV
	igs30XHQ9qfAs+B5GwNmU9ISVDRVEePMhoE=
X-Received: by 2002:a05:620a:271b:b0:93e:60e8:c9ad with SMTP id af79cd13be357-947afcd62demr595319885a.12.1794434345467;
        Wed, 11 Nov 2026 13:59:05 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947b035710bsm268231485a.42.2026.11.11.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:05 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Wed, 11 Nov 2026 22:59:02 +0100
Message-ID: <20261111215902.574916-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_tx() hands the frame to the device and counts it in
tx.queued_cnt afterwards. The TX status of the frame is handled in the
WMI event tasklet, which can run before the sender gets to the counter.
ath9k_htc_tx_process() then takes the counter below zero, warns and
sets it to zero, and the sender's increment leaves it one too high for
good:

WARNING: CPU: 0 PID: 348 at drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:510 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
Call trace:
 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
 ath9k_htc_txstatus+0x58/0x140 [ath9k_htc]
 ath9k_wmi_event_tasklet+0x16c/0x17c [ath9k_htc]
 tasklet_action_common+0x108/0x150

Count the frame before it is sent and take it back if the send fails.

Fixes: 8e86a54715c4 ("ath9k_htc: Fix TX queue management")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 0d6272ac0dac..ee87352d1241 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -888,17 +888,21 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
 		goto fail_tx;
 	}
 
+	ath9k_htc_check_stop_queues(priv);
+
 	ret = ath9k_htc_tx_start(priv, control->sta, skb, slot, false);
 	if (ret != 0) {
 		ath_dbg(common, XMIT, "Tx failed\n");
 		goto clear_slot;
 	}
 
-	ath9k_htc_check_stop_queues(priv);
-
 	return;
 
 clear_slot:
+	spin_lock_bh(&priv->tx.tx_lock);
+	priv->tx.queued_cnt--;
+	spin_unlock_bh(&priv->tx.tx_lock);
+	ath9k_htc_check_wake_queues(priv);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
 	dev_kfree_skb_any(skb);

base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.56.0

