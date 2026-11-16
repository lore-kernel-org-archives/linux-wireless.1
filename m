Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813621;
	b=XykUP69BNeF76rZM7V8/692aavIY+Zl7RhTG3OaG2CbAh82KBiwuXPKPh1tGtkgnmldw
	 UTLSB1su5SJPAb0OmIU08wCckC59b2ev5Er5Yk3XjJij+MODVc4YmsOL2iuVPpjmdK7qp
	 R5X8jD0U8D5YI36JEsfP/Zk1veAIebaJ2TFyiPsTv8m9YJrpVWFzbtI+L7Vl+6FdTDdcV
	 K5rySzD/VGhJyjm6RJg0J5GuUUIZoOSI0y0BzAwqopo72J4TbqiFpHKMlRPFRPA2bA+ee
	 3R767KR8TchV3pNi9PWEL6Bx1dFzcE/AmQh/GqMzqgidHGC1Vm1CqFvwzdXd9Hren0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
	b=IyAO5oUjlJs5WM3sAGgj0q/lsgWDGYw6gnwH1IepiwZHdjgA3qLwiRgpnhwzQJzxoKZ/
	 1d50cYkmwiVkZAcxfPXYyB3fJHMiQ7AQVeD/gb0HH8ZNraVk2nuya4+G9fgAVov3N4Ncz
	 H1+mUfLD2N7HQeNJB9joBAWdyERz3llrZTrEVuF5PDn+nkZtaJqAbN4UJ+u1TIJiSTKlk
	 cgWLxHUkVyiMeqpst+cjxqG+llb/R2Y9GzMPJEHfDlWiDJC9hbqkP13k9wuWF8+T672Au
	 W2pdLZvWKvquS/mS1euLAHXdS9Poujcdc1u/PcInRhdU2x2VgKSBW2S0KUIaNwnGbRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yuD1VX3t;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A33606A893
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A33606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yuD1VX3t
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1992761f8f.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813620; x=1795418420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
        b=yuD1VX3tmlO9yiXfShOqAenHPtxtz1Jvt1ArP+JGgUu8Q/JRJ+Oym0gicOE035HMjl
         w1oy9xfUyUbzZIWa77n+GXiYY6PfW4+L0B3kCntL4NV/deUw14g8K50nh7FC3K/OFdXx
         k9yzrAhrrv7vhoMYgohMErrgF6LXrkRmwIpn+eyYySP4ZKLRePTz+/XADYeGE/wJg1Bm
         +l0H2iLozE9rr4fI+N++8aF1dVC++ZO7wmUaSsLSIhZX7LD1yXD1C4xv0l87RXiYieW4
         1SdetRJAv1gSeV0Z7K2hUM7aWrqRzcGGa8PupuXMb+y8W3Mn2CWwDlQZRbLdC9O1ZX46
         V7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813620; x=1795418420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wciQv0OYjVv7FW/4CBvG8BeXBZomqSPRimAuRooCu/M=;
        b=pRVavBmpS3uQQ+YaEzxPy0FQqiw8vtgiJkfysyGHr43/KPTLvJdFlYbEktM25wMMzr
         QKW+8HCMHtq2tXZvCr7k9NzS6t2DR/tabUjTB7Ou4YDAbT2C4oWSVXZ/ggwhEfB9rEwY
         b8opH5of0orrMfyaNVcircOD4X1vOTWTumZxBZu9uB0h0vFtIKwRejFzUK+4qEcIR9zX
         5ENSw8q2AzqMqnxyOk6EcoUmiGwk6O2ehxdDmCcCxTaWw/jkJddHxRLlX0MVHVw08Hb3
         tttI+C6ICsmw98bb5YNfifA1UwwYpsaChpIHUJJKMykH5JFqjdxPHlVH7lZHTGU3mJpd
         xkWQ==
X-Forwarded-Encrypted: i=1; AL+hErFRmPmAPV2yUr7l71GC/WA5fXAOpE/3fbVG40S2nRwXbS09vAbVRT7DRCAWqmeJMl/sSfHj36sbaCJnmLh0xA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gojSFLy8xnWQdtxkPSiC+9FA08uiQr1Gnbaj4zQkNRuR9gWHO
	Js1ppDomGeNi1VpAvluno/sO+dXKjPQL+4jv0b1wMJ3czKnPaNa5V4gp
X-Gm-Gg: AYBFou1tuboDPAp5e9eaq5fLb6pXtc9mxgkG92+yWBs4SWntJWmgAhBg6fMYc0094Go
	8wLPqtsPOg4bepcUAvSxUxrunO4OA42527xubekRITR2aiK0K+zGS7gs7CLilymOswTBBOBLgtx
	3wB9iMttu+wAGiHnPU1fn7YBWD+0m2WRIBkCI4tM7BEJ6pioDxHKaYQu2EcOaTNtmoLFoblgj1H
	GsGIpZAMQF8VQRZFl09hsIgZOywNHu6JPfbDPxXaWkG6ioCoJearIhTIrcRob9UZ1hhTc6xUZr3
	r0Q5Sdvt+vbAD9GYSKtikCmoEUnjzGVxffF7FsldxzmhQEH3yLJzLdVaHe08nteDE224gj1rHRn
	1b58RA2Qmkbi343pFc2N6nf9jtncEBsYOX7cX4kGINxb+JkeeU1+ncX6n4sA8D0sWXUGhMr72zl
	L8OK3hlQvORlqhAcXm2fkpzA+UEMIPQH4D6nzv020+J60pnbnhvHWklA//DwWjzzCktxInBNocx
	whcI+XlcQISooy1rFLc1SNsWqdJE3NKVc7nTbeNTYqhamXVvOIJ2cGGzwYnXeI+otuGf8/Oc6fu
	HCL00VGOwXhOIoxiPJ8+ccj2t4oOZhfbdig=
X-Received: by 2002:a05:6000:1863:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-49c7026386fmr23687181f8f.21.1794813619721;
        Sun, 15 Nov 2026 23:20:19 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:19 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 3/3] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Mon, 16 Nov 2026 08:20:14 +0100
Message-ID: <20261116072014.1142494-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index ce65a1a80840..8e7ae747b900 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -664,7 +664,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

