Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302463;
	b=NuJpDdDxzvErLlSJdenpPlCK6ufYltLfXV8nH9kOmtW1j6nsN7ml2VJ8yh8HG01tEGAF
	 BHcW0G2g2Jp4ydHsVdkD+BbYzpAATrzFD5SbCPqnmSRqsgmr1eVINv8MuYnpkK3aLkv9u
	 lRM4DEiIHxSocGhpiSEmS+302F3e4dGu84IFV45Feml6+Uq0eakFpYnjuQ0nEifRwCR23
	 TJmF6Bd8vFIxTr9v8EoJ/HG4CxhY1EeIIRACV50iIrrQ3wsAHhlNcYneDhiLevqhYAolD
	 V33qaIwRngzeXiIMiZh8cCcHzDOl5+AvNYZNmPgY+y6i9uWs9zUY7FNRWeyKbaYs8rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
	b=JqmMJ1zgNyodKyIaOWXkZy51tm/Ucc8KzBlwhdIhbKiut3eIDcGx0CtMOKkePGV4YmgD
	 2VnXo7/GimJuKTjw/iHSAnbhHpHWmqbeGDIZ0ogvgT3IEreXvZhxvXTEuMofSEEZ5uIdM
	 olbacww/maonLi2JvN9REl57QqkpsAU7l5jm0t3pQL7CEouf8Krs2QWKVx3CWO9yNx7kE
	 +cwHqgf7uIhYxvmaHXz6JlM+b4K9E9gOrSxg/ZY9Gd8SK2hQM1yo45ZozYH37PZ3PHf2Z
	 pm99e4UhduiXkSqXQNaV2y6Nt6AOCqJjlHpJdiZJsgE7pYZcj+tvb3lY2C4pHH6JMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hViEOR77;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68A606A6BD
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E68A606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hViEOR77
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d28f75d62so360110466b.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302462; x=1795907262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=hViEOR77vvb48wZzRWUrPldcdOdYdzqZg1ZpZmKwlQcepmRMcwB+zvuKGYv3qrmsoo
         ZYVv/z7JZrcd8hJVzX4kKTi5isBqdwxd1LOeU3LshKJqyHFtfPT/hrLa5q+HpY/cpHV3
         kmKsZDpYW0dwDyz9MAub1wiYW1p2BM6nNRpB56MCbUI9k1u49r+mxMHewH9oEDpvI6DB
         +NXYZiXd6TUtafpZew45jOmV3Fshk6hVING3m0z9jTFp6dZ2fWyaRWrs8OQXyra0LUw1
         p+7tChwn69UVjX8JM5SO2+g61xschK0dVIaaC2bVUzChBdSzFsLxvPtrJQknzCmUx7qm
         9E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302462; x=1795907262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=1B7A/OcvN4N9vsgeyTjus8hAq3+D3YgIEx2MC1jt+u0/rurhO9H637/7TOhkxBitBF
         aeEhl0m5+UiJJGQQGrLhT107MeHkG7kBMZsUvdINc68aUZ27HdQ1BPFfjFgdgpqjx0Cd
         3AEa8Aoac3NBDZW/viq7j06Px216OlE+ADAs+w4tR6TM2XkZ2/Iwc+WVLR368sFKH3dg
         ChdTOzX53DhD+ljgOuxDshMdvfwc9/qn4y+IiMAwQCFKpeT1ue2Cerxvnwfh8jZhJi84
         v1jrrqPhY3ePslN5odj1pj0tqEqOYzFbxTGjDUtgRP+DQzc3TZjiNt6cCUrbcvdglnhV
         zhBQ==
X-Forwarded-Encrypted: i=1; AL+hErEM1pdjdiAD2zzYOtweYGh4ZK7WtGgH//ULp66Mc0yygwemmcd2/t2S7s9SJdaSul4xMyw3E+Jt419MFsKiqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NHJwFjmXTib5ORrcEWHUxYmCdcdIb2XlxR9/T6jH7VPKmTAue
	mIwPRR5dRRQraUOO9deXBrezIMvLjGhDiq65qUZ+EOoVik8rhf4TzpS3N4MhX5PEEg==
X-Gm-Gg: AZFdTZe8BD4zkfBzJvobek5c6OWyheAWNEPRMVMS4L6yAPhX9tkWYjMHhH5Y0M89S5e
	AJDc/PPN6AxMWWuvNC5UKp2OKnIesig7iaBiOqZHymDfwkgDQ0ldy3hg2avJNX4zDq78x8NjNj0
	maDM0KXjYfIWrCurt1gUAWWhuhquFupZWrGtCfteBySBo0jF/DPMRkxvX8zsumBtDp2VqIqFoHk
	1OACeGYDchjNrtaf/C0ufTCf49UBxdPHEuUlu23rIfAR5PgqVzpSRlKDT8laUxVdvEExlGbPOEg
	+YM/Nwo9C9/5r7ClYSZzEAisjOMA2FCtlVuL3c5HQTFBS/FF5MJzqlhCQSNh72Mi3hrroEi68P+
	gFHhciPSHZxjYTLzURyGa4lo+Gk+XLMw652jlp3sbRoNn8QQjx9o9+SDNDF/gsDwXJZI5EEMCCt
	MIiQlPHYoQepS1jqbcS4GrOv67I6ePf1iqSU3+PwNndolaRgC95/pox/XDJjz2eIjKdsYoNOmE0
	oH0+HTfjLOmGM81XYzVb82HOx5g+VCOH2BhTBORhgdA5C+642dwZkpxk062xHZNBg/Q0Vm/9INB
	O3VjzyQDJomF8DozX4i0RRIjGqRE642z0+vM/KQSY9oaIPSKYpc+lYb3LYlm+8m2DNejcHv5V21
	HaPZUcgUphgvAlx9HCVs5WriQhclqlEtzAvBP3Y/blA3GK9Mx5OucxPMDiev09a0SmN02EXfNNI
	3SgBmsyNn+smX3wbh+t0CxRVphuyxDN8zUajQkDxuuWDYiiP6pTA0XJkgikbcVlUMQRPlfqEmnH
	h/EZmdJeGIsnvuptu6MHbk3i5zrDJHi0CR/zrAcsxdEVm1Tt3pxirZW174nQLM4pONwN6AS82w5
	aFV3X52sXcjgxFuCOO5sHyxAYJ9Gz386m2fNUBI9wNr2GUuMBrG9JRyjl7QkYvdy6uheSI7z+fk
	=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr413314766b.26.1795302461807;
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 05/13] wifi: ath11k: hold back WMI commands while the firmware restarts
Date: Sun, 22 Nov 2026 00:07:23 +0100
Message-ID: <20261121230731.1206043-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
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

ath11k_core_restart() brings the firmware up outside mac80211's restart,
so cfg80211 operations keep sending WMI commands while the HTC services
reconnect and before the firmware reports ready. These commands crash
the restarting firmware again, and recovery then fails on the unified
ready timeout:

  ath11k c000000.wifi: failed to receive wmi unified ready event: -110
  ath11k c000000.wifi: failed to reconfigure driver on crash recovery

With iw setting the RTS threshold in a loop from the moment the firmware
stops, the firmware crashed 15, 15 and 11 times on three triggers
before recovery succeeded. With this patch it crashed once per trigger
(5 of 5).

Return -ESHUTDOWN for commands from outside the restart worker while
ATH11K_FLAG_RECOVERY is set. mac80211 replays the configuration when the
driver restarts the hardware. Test the flag on every try of the send
loop, not only on entry: a command that already waits for a WMI credit
or a CE descriptor when the firmware crashes would otherwise be sent once
the restart worker's own commands free one. Wake the waiters for CE
descriptors in ath11k_core_pre_reconfigure_recovery(), as it already
does for credits, so they return when the recovery starts.

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag also during a
recovery, while the restart worker is still bringing the firmware up.
Clear it there only on the first boot.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: test RECOVERY on every try of the send loops, wake the CE descriptor
waiters in ath11k_core_pre_reconfigure_recovery(), clear RECOVERY in the
FW_READY handler only on the first boot. Florian's Tested-by dropped, as the
code changed.

 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7456a8422654..e8d245f1023a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2463,6 +2463,8 @@ void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		wake_up(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
 	wake_up(&ab->peer_mapping_wq);
 
 	reinit_completion(&ab->driver_recovery);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index a176e6498ec9..aee32aec8732 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
 					  &ab->dev_flags);
+				clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5f2412982229..82b8481ba818 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -303,6 +303,17 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	return ret;
 }
 
+/*
+ * While the firmware restarts, only the restart work talks to it.
+ * Tested on every try, so that a sender which already waits for a
+ * credit or a CE descriptor when the firmware crashes is held back too.
+ */
+static bool ath11k_wmi_cmd_held_back(struct ath11k_base *ab)
+{
+	return test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	       current_work() != &ab->restart_work;
+}
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id)
 {
@@ -314,7 +325,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 	if (ab->hw_params.credit_flow) {
 		wait_event_timeout(wmi_ab->tx_credits_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
@@ -324,7 +338,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			}), WMI_SEND_TIMEOUT_HZ);
 	} else {
 		wait_event_timeout(wmi->tx_ce_desc_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
-- 
2.53.0

