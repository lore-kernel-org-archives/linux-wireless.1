Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302470;
	b=3zy1fDkoydNo6F0f9HMC/fXb3gAVNh2l5rZHcXJDD8CXHJJyDTll/IzqsyIGrlmMRZB0
	 icf6cxCiNazkuOymJ7QuFz1K8dVVxEUtdyaNwbqaJT20ANHMgQtuOboGxtj5mDKMEBb7Q
	 e1S07nZgGl9YyVn83poPVDu17Bo7PDmrdPYGbtFAL2bbm+GH4E6pf0obd8ZOAs7tY49Jo
	 tcmKOcpwduu86hq6fE6TE3/5SJ/csKRJChjiVEE1KbOxpnksplV49rA25a/UTVC0OCifd
	 M3NZ2fh1Taq2VI+WGqzLC1X5NDq2o8zVQqvOomGpbWlzQeu9HyO+luunpUnV4lC5YZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
	b=e68uDWspMfDFTJhb99xPWxdwu2NV+J29nmxJB+RJpExa2kIGj0vq3JT6JxMbQ4zSRBBM
	 deH8maJVyNHSesac1Hkf0YKN8m8Y7zOPL/NnCqmwIJwEAIZAUiYY09Zho4uofWaEZVcV1
	 SLWONMvScZpVOBO2apon1hyOU9Iik+x8zdEVswkykLc18Y0HpVQW+XZHILtzJ7DMn0eia
	 ciReeNxg8P8fQ040L+J63CB49v8xv1R+dKwM91P52jCuQj3+vKtGcP7nEOcoTRxLSRSfh
	 OVQnwiolKwLBYnJwcY785aU3pubrjDAsLbhZUWQVZvT15yEUMRzRsARu2yZypf5lmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JcBzBLkB;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AC760A3804
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AC760A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=JcBzBLkB
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c51373ae637so323922966b.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302468; x=1795907268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=JcBzBLkBbabbjnUzyZkJCTQOUMeZlV++pXiJqlIgCLN7/S2luV7Ylz0Gbzc21vv+Cj
         WDJ/Wer0cG4EA2LOHv0Snh+7boeFsKAn10PQw1nvGfLzPqDnIsJizo+e96ORX4cR1k5g
         KdXwBDjhvNSMMmH1aws+gHSkSIS7JnSMdpXLzvvEFoUWHUM0yTOgppDsFU0QcZfSCIbh
         t19bZ1M2DUOJZ2z2Lej8KFQ2w/8T2QVzoHNqmqZ2lDb/sTVVn9rhZ9Rmp7cgY3Pk7I+M
         c4pu7B0wdO9C6p7CAawrldEhuDa6sT1wsl2dnQr2VzW7Atpsx9G0nwdsWU6zUZNat7Fg
         i9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302468; x=1795907268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpQhoYWqRN3wyjl4/Pm/giPsZJPxZ0KHVMsW8Smmq8A=;
        b=ts5CNEBd+4S6otSE8KKPz+xWjv8zWHgNcdSPcU66jPZOVkEC23MnClUuKA8kilMkXI
         l2dZfK4JS50YtlLNZeSz54M9MWaDkmHvzB8e7yblr3UlvY2jbuuJgmNt0gMF/jEUHG5i
         h0DHEYIKU4b8F6UfUOmaL+63cQKTSZQTAAb+SaHIOh1sAx1vj2gJVhJwSEHlzxu7y81/
         cJAdqFpszWGi2I5eC7NKQr6IwPElpTSIo29g3uGnBAVaMwqTUZCrYuvQqergvUELD7VB
         llq28ohc7ndJjBOCJaZKQ3KkUs50PdrlnO/It4MxdYnoe+OeOjeQsoqWI50DByeupfFA
         2r2Q==
X-Forwarded-Encrypted: i=1; AL+hErFciDquI44PdSW5oYzoGYO2FY9Nlusmn3rH0QlAT2fdD1actVQ0IMRprKbsqs2G4tlL7T54RAStbfIwhR+S9Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TlPkkMGOrZFCLbJC1wdGTu5P3PeBydsjeVbkuSC7OSJq1cR+C
	/ss2qD022Hd0s61VGVbP4v620OV2Ou58XpTeE2/6ymGTB3JSy/F3P+3+zjTUBJ+bhA==
X-Gm-Gg: AZFdTZcfeojoDe6t+Ph9TNuC2ZNt65v8tmaQ9y8BQ9HApFuEJV4uBwfjxc3X7zVeqjZ
	GqJicsVFmXvtjztm9mnZ7/etgrgc4sFey3TpKumvTaXrcmz7KYUMMcQGAKCMUkkOv8cmT3s37od
	jDuGSGupcv9lPtgYaWwodoTbcy8QdLN6PyNF7j7eciGlsFNLycuxvRpsT9Wc8keAltTclDHL12r
	RjjvpYQ6Dx1xtBRY6ts8X+8UTIFfMW/EwmvI8aowT7PQ7uJRR3mzD2oM1KG7Kxe9Vft7q3HcdAq
	/8QoWqm+FfMrEhH3BrzGcVkEwX6Di+1ai6fuUN5z32wUDWMs35C0gFYXyGpapM4twzXWENm7jGV
	Iy7V9X4UB2lLsnh/iBcA2akwZ6Nwwl95F2mmAVir/Hee8mc+u12f4wdeqoDO4XSKt7tPKwbuQOT
	RNc+AOXxNGbi2BOH+kePTKU+TeKucvXl5m2v4Zkp7NtbiufZhSVMikqkOyjZzAwVgvvZK8qA4z9
	DE1y3h4a7Ozt70eS5J2F1PDawL8g6SwHZ/DPPoBwc4OaoIiUxg7+4poMkO+kSKw7wNaA4G0ZGVU
	CuuVj2wq2/B/DX5Gz4mtZixjcvlX2eJIvAoizH6OgkOHiCrCLPHWHygUx5A1bSe7StAGo5u4iRB
	a+dWsglQkc1HnDCliTU4W/Vu0KMwqAQCGFeAIySN1qIM6cyM4DFnwc1kKfxoWl19JaBsHgfFGxb
	4vu2U9tj5t7FaFo0sM6KDioCpCgmo4wtnUkQuhF3Y8SyaLR4+xIzSmvFl0bjT8olTdjHIyykIu6
	K91w1KAa04kWovZhEFbed5vIQNv/t/i1T7KdtDEeIr5UmY1PS20ghaJtp4pqzd6lB2h6ohr+ppy
	pEnwoY4ARPlyKDDnUUY3yVIxQ53nslJDB2E34ijlp3wMoBCuL2oc6wzcnvKf8e7zGWCWB1fb9AE
	=
X-Received: by 2002:a17:906:f8d2:b0:c50:bf14:8eb1 with SMTP id a640c23a62f3a-c513a84d84emr489568866b.14.1795302468046;
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:46 -0800 (PST)
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
Subject: [PATCH ath-next v3 08/13] wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash
Date: Sun, 22 Nov 2026 00:07:26 +0100
Message-ID: <20261121230731.1206043-9-julius@bairaktaris.de>
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

From: Florian Maurer <fmaurer@disroot.org>

On IPQ8074 a firmware crash is handled by remoteproc, which stops the
remote processor and thereby resets WCSS. ath11k sets
ATH11K_FLAG_CRASH_FLUSH, which stops the TX paths, only when it handles
the QMI server exit event. That event results from the glink teardown
in rproc_stop() and is handled asynchronously, so it can be processed
after WCSS is already in reset. A TX in that window writes a ring head
pointer to the reset block, which ends in an asynchronous SError:

  remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss
  SError Interrupt on CPU3, code 0x00000000bf000002 -- SError
  pc : ath11k_dp_tx+0x45c/0x878 [ath11k]
  Kernel panic - not syncing: Asynchronous SError Interrupt

remoteproc sends a QCOM_SSR_BEFORE_SHUTDOWN notification with crashed
set before it stops the processor. Register for it, like ath10k does on
SNOC, set ATH11K_FLAG_CRASH_FLUSH there and wait with synchronize_rcu()
for TX paths which have not seen the flag yet. ath11k_dp_tx() is called
by mac80211 within RCU read-side critical sections or with BHs
disabled. Check the flag in ath11k_ce_send() again under ce_lock, so
that this also covers WMI and HTC.

This stops new TX descriptors, for data and for everything sent through
CE. Ring pointer updates from the RX and TX completion paths (NAPI, CE
tasklets) are not stopped by this.

A crash during the restart work of an earlier crash, after the QMI
firmware start and before ath11k_core_qmi_firmware_ready() clears
ATH11K_FLAG_CRASH_FLUSH after ath11k_dp_alloc(), is not covered yet:
the flag set by the notifier is cleared again, and CE/HTC sends from
the restart work can still reach the reset WCSS. mac80211 data queues
are still stopped at that point. That window is a few milliseconds and
will be addressed separately.

The SSR subsystem name depends on the remoteproc driver, so add it to
hw_params. Only IPQ8074 sets it for now. qcom_register_ssr_notifier()
must be reachable from ath11k_ahb, so add the same Kconfig dependency
on QCOM_RPROC_COMMON as ath10k SNOC has.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/Kconfig |  1 +
 drivers/net/wireless/ath/ath11k/ahb.c   | 59 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/ahb.h   |  2 +
 drivers/net/wireless/ath/ath11k/ce.c    |  7 +++
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 6 files changed, 71 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 2b608d4ed263..7dcc2c3543eb 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -13,6 +13,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	depends on QCOM_RPROC_COMMON || QCOM_RPROC_COMMON=n
 	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 3ff7d5f27f5e..893a3270394e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -20,6 +20,7 @@
 #include "pcic.h"
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/remoteproc/qcom_rproc.h>
 
 static const struct of_device_id ath11k_ahb_of_match[] = {
 	/* TODO: Should we change the compatible string to something similar
@@ -832,6 +833,60 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
 };
 
+static int ath11k_ahb_ssr_notifier(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct ath11k_ahb *ab_ahb = container_of(nb, struct ath11k_ahb, ssr_nb);
+	struct ath11k_base *ab = container_of((void *)ab_ahb, struct ath11k_base,
+					      drv_priv);
+	struct qcom_ssr_notify_data *notify = data;
+
+	if (action != QCOM_SSR_BEFORE_SHUTDOWN || !notify->crashed)
+		return NOTIFY_DONE;
+
+	/* WCSS can be reset before the QMI server exit event sets the flag.
+	 * ath11k_dp_tx() runs in RCU read-side sections or with BHs disabled
+	 * and ath11k_ce_send() checks the flag under ce_lock, so after
+	 * synchronize_rcu() no new TX descriptors are queued.
+	 */
+	ath11k_dbg(ab, ATH11K_DBG_AHB, "firmware crashed, stopping tx\n");
+	set_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+	synchronize_rcu();
+
+	return NOTIFY_OK;
+}
+
+static void ath11k_ahb_register_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	void *handle;
+
+	if (!ab->hw_params.ssr_name)
+		return;
+
+	ab_ahb->ssr_nb.notifier_call = ath11k_ahb_ssr_notifier;
+	handle = qcom_register_ssr_notifier(ab->hw_params.ssr_name,
+					    &ab_ahb->ssr_nb);
+	if (IS_ERR(handle)) {
+		ath11k_warn(ab, "failed to register ssr notifier: %ld\n",
+			    PTR_ERR(handle));
+		return;
+	}
+
+	ab_ahb->ssr_handle = handle;
+}
+
+static void ath11k_ahb_unregister_ssr_notifier(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	if (!ab_ahb->ssr_handle)
+		return;
+
+	qcom_unregister_ssr_notifier(ab_ahb->ssr_handle, &ab_ahb->ssr_nb);
+	ab_ahb->ssr_handle = NULL;
+}
+
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
 {
 	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
@@ -1230,6 +1285,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
+	ath11k_ahb_register_ssr_notifier(ab);
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
@@ -1247,6 +1304,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	return 0;
 
 err_ce_free:
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
@@ -1288,6 +1346,7 @@ static void ath11k_ahb_free_resources(struct ath11k_base *ab)
 {
 	struct platform_device *pdev = ab->pdev;
 
+	ath11k_ahb_unregister_ssr_notifier(ab);
 	ath11k_ahb_free_irq(ab);
 	ath11k_hal_srng_deinit(ab);
 	ath11k_ahb_release_smp2p_handle(ab);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 8c1eb1e8e6b1..d7ea47f42edf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -23,6 +23,8 @@ struct ath11k_base;
 
 struct ath11k_ahb {
 	struct rproc *tgt_rproc;
+	struct notifier_block ssr_nb;
+	void *ssr_handle;
 	struct {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index af08a2a24c6d..08fd0ab353e4 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -745,6 +745,12 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 
 	spin_lock_bh(&ab->ce.ce_lock);
 
+	/* Check again with BHs disabled, see ath11k_ahb_ssr_notifier() */
+	if (test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags)) {
+		ret = -ESHUTDOWN;
+		goto err_ce_unlock;
+	}
+
 	write_index = pipe->src_ring->write_index;
 	nentries_mask = pipe->src_ring->nentries_mask;
 
@@ -791,6 +797,7 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,
 err_unlock:
 	spin_unlock_bh(&srng->lock);
 
+err_ce_unlock:
 	spin_unlock_bh(&ab->ce.ce_lock);
 
 	return ret;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index e8d245f1023a..d4845a1300d9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -91,6 +91,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_mm = true,
 		.coldboot_cal_ftm = true,
 		.cbcal_restart_fw = true,
+		.ssr_name = "q6wcss",
 		.fw_mem_mode = 0,
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..ce52c61d661d 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -191,6 +191,7 @@ struct ath11k_hw_params {
 	bool coldboot_cal_mm;
 	bool coldboot_cal_ftm;
 	bool cbcal_restart_fw;
+	const char *ssr_name;
 	int fw_mem_mode;
 	u32 num_vdevs;
 	u32 num_peers;
-- 
2.53.0

