Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644937;
	b=BNGfQtpyMtwzA8Tci5R261nV0osx9DDq+zChJ+mX7jgcxCm1lxccwwzFW+U/ltREwzBU
	 Ml1DCInoz528YJl1XHtIU1Xt2ZPLLzEPFM12BcH/Xg1AqTVVM3MSyLG3/ARp+S1XwrHOT
	 LRDDymtdNI8VoI9D9KGRrPbkL+s0/qFgldarG12+9e8glO30/NDTpAaw7B/wI5kc2cxRG
	 ePww1BmSFCOGyRW4Ah9KbTScBJL5na75ZvdxwWICqO4527gHYn7LsBjkTbxH5lyWbQWD+
	 8+6hPkNr7tPsJOjPafsaYbgSXNoWdBls4idCY1Sog2NgHwouEPdMGBvrungqaRG50EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
	b=aBDey7Zxqb7+5regeaCaAMpJhME2uqFSEAREdKuSZAWBeeLL9d9sUuY4MxJ69dRwDO68
	 o+BivjkVjVxwvQs47MoBX9Djfd+DiET2aAEKzwmd+QiESy/mx2n4rmv3gGkj5ME09+TAk
	 OYwt1w75zhXOvySeUztyoyxs6m/KeocO4Tym1wnygFMbNxhopDY3ab+gnPw/wpRO13oIr
	 C/4hJlsY/6OpOrKOKALeGB1YfMb8IwqaDMUzkLBWjeMrj58BX9D+dtpbE9jPkRPfPGc/j
	 Y8RN0lpr3jmXvC3hASoyycMo4QD/wlok90o5P/k0KB065L8JpcnjaCAa0Gv8biLrRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="eQN/XD6H";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E6606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1E6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eQN/XD6H
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so6672093eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 14:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644936; x=1796249736; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=eQN/XD6Hq8wMXIj1ecSVa1boHANg4KhmxmXSv42V30BijwxyKn9dP/cEnIHUx72yJm
         mi66UrhqpqZGm7vA85JDOFVORQL5WAPpi4T0DPthelVppjHBX0ZnnD6BL8QR+u76L+Jv
         mbpQmftPDARFAYpQDVayDuhbYa2gYjTLWuT3yCsw6i59uREfA5iajifhdYLcz6hApWm7
         nbTvmDaVO94Mvqwyp/pEXzyTpceH9Gbog0Mr3ytJahErNL2HwY/aA00EmtYxkE4Ev+4u
         TOJY0DqP+dQTbHeAlJ0in894XvDmVMA6Twnr6Q+EwGfk50WQ4zk3hAWNtneRFdvFO0ND
         +VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644936; x=1796249736;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoLpNZUPpAV0s/IN4AE3BuQqpTSM/yM+54mb7fzDFTw=;
        b=fWJUfY0YXxPqG+HV4FXYPLqVNg8O91hAPVV96sfujJ+hqKETJbfAoEFFvkEay0RVyN
         bPB5TvgKqCPGXmbqh1LBdEefxIun60ruM4p6O6lJvDqIBIIickhpS7+AZwQAPTjEKJ+6
         sY+BO56h9lv0cMnxv2G9eAmduRPKiLsXheiRjbu3Bc19siwjTertITjYZ6pZXYpgW65d
         p2LyUTXI1PloLsmCP116SVagYDqlyjZVW/Tekx/PP65HneAtQGg1flxsHFL4jZgKLz3D
         c/XdoT/TY5bcdDetOFWta6HS8YFTezxN2hJ+4m4ZrD0ITwqNIOwn1hict4b0AiPm1ryU
         PqIw==
X-Forwarded-Encrypted: i=1; AL+hErGkatuolskuXcSOXq3yxmcyVN2vB8l5wcc0Yf+2V/5nV3MvT1EWrSqyoRMekGW4T4YACX+oNftO9++I4sZecg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wsc9NesEM6zDxbDW+v+vm7atRnht6ubGm3jgJg9ce853fR7rP
	phibHZH+HgUaJGO3FWvm528vE+90+izMeoAi11ea8h6EQrZv/4op46xC4K3840Bs9JZB0sHFVcB
	t8g==
X-Received: from dybqf1.prod.google.com ([2002:a05:7301:6481:b0:386:a9a2:8031])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4143:10b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-386b1067bf5mr12106547eec.20.1795644935493; Wed, 25
 Nov 2026 14:15:35 -0800 (PST)
Date: Wed, 25 Nov 2026 22:13:22 +0000
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221322.1412935-1-elkin@google.com>
Subject: [PATCH wireless] wifi: mt76: mt7925: fix UAF and skb leak in mt7925_mcu_rx_event()
From: Elkin Cruz <elkin@google.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mt7925_mcu_rx_event() caches rxd = (struct mt7925_mcu_rxd *)skb->data
before calling skb_linearize(skb). When skb is non-linear,
skb_linearize() reallocates skb->head via pskb_expand_head() and frees
the old packet buffer, leaving rxd dangling into freed memory when
rxd->option is subsequently dereferenced.

In addition, mt7925_queue_rx_skb() transfers full ownership of skb to
mt7925_mcu_rx_event(), so returning directly when skb_linearize() fails
leaks skb.

Free skb on skb_linearize() failure and assign rxd from skb->data only
after skb_linearize() succeeds, matching sibling mt7921_mcu_rx_event()
after commit 4361f1660101 ("wifi: mt76: mt7921: fix memory leak when
skb_linearize fails in mcu rx event").

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index bfc1660d1c6f..42af38941aed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -715,10 +715,14 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 
 void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
-	struct mt7925_mcu_rxd *rxd = (struct mt7925_mcu_rxd *)skb->data;
+	struct mt7925_mcu_rxd *rxd;
 
-	if (skb_linearize(skb))
+	if (skb_linearize(skb)) {
+		dev_kfree_skb(skb);
 		return;
+	}
+
+	rxd = (struct mt7925_mcu_rxd *)skb->data;
 
 	if (rxd->option & MCU_UNI_CMD_UNSOLICITED_EVENT) {
 		mt7925_mcu_uni_rx_unsolicited_event(dev, skb);
-- 
2.56.1.839.g22a8290db9-goog

