Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302459;
	b=ijQtormTYOwddtPgk8kghHUwsrKuIkcphPzK9CeI5Vd/ACj76Sx4A57y+6owketZpnG7
	 BJ4EJ9LVwmPXXF07whVcycHtUVk8mWGiCoBV1LoJVB64ZeooqrQ/BePeoGCVwOuZV3Wrz
	 RM4xz37Oby+khFfrOyuz6xG4xmHWtJZtdANEyiPplyS9cJv1IlOKCkkKWmYlWEyg4HRP0
	 7x3DUwRiVlEjMVvXGLZZb+/j3f7io53w/hBvZl5KlLyGyBOxlZH6oFec4Rigvom6kD8Hk
	 aPlLJT1O1GC1ELA0pwX3d5q73f+0ljffl8FUvPQi2Ha7kJvy6RUGMO4zgc/EzAFCcqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
	b=Iw36qsR2RDQIN4iTvyDjM5qa641L7jcW98R8+GZseHmJ/WymTnTqVC81z4DE3srW1Wcy
	 OFIjqoIhsTY+HPXDU3X2sEzy243NjxZLv64Hf6G31gmr+olc56Iu85fLiEneSmfhWeuju
	 wmydGQVgBgn+snamxKyz1+oFQHFIY1lpSX0ZY4kBOL33Vr7sN6iG6hmGy+6mZphuFk3dr
	 LawJT7vHKs5gFa7ZedEeBrRP/HVvQpSkRdcuSLbNKDO6bMHEMB0WStSb6oWD6ktJKKHk+
	 ELnVzZAP1Gp4YUC9JiqQVFNCYCBslWqaiNouMsA1wJG9lGilvPAH0LD1aSt0uf0Qm0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W0X2B71Z;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC45606A69A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC45606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=W0X2B71Z
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391287866b.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302457; x=1795907257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=W0X2B71ZJTucaJ/Bp6BW0FMPpswkNXe4wtLaX7UfB//Om+KNYhFCIsdtFFLNxndHNm
         YICs20ngVo+8diCreK2LjrLJTAbZ7PCPdp8dZiKlQTyHMnDuCrG+lvCS/Lqnd7jIG9Cq
         9WGjq/2cqeeKNZFwVhX+IV9woP6jsBZ14CQl9Bl7coqT9WdJhbYwoKl3vpOJdG0Y2RFI
         pmBlYZp6sWSu/FozQH2LPoAlmt0wYD0f9mObmQO9KSOPsYwQseRdN6qrOBl4aRI0man7
         4CndfXdHLLitu3Ew3tJPmK27nJAoO8lr7QNJJuNvy/KrmQ8rhBAl0IgOhfxL6K/Dl7KB
         q4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302457; x=1795907257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPsfghuAOvZXGmgP8YNMyy86FtkIG7/XEGKOG2j+8RA=;
        b=pP2Dnp+9wpI4Qmaabe73+a4T0cNRhqT/rNhUKXCzMgJ+KYShcXUTyw/v0taBFwtsce
         5hVSv53/hRJ0fXvyOKjsb7m6XuN56HnaROqGN6yIhXLWXKagQipWWYF2MfwGVe3fiQXk
         293x59bTKGHtIqdChTNSc0oJ3XjFiXLWB/xVgYEzDTtf1m1KMb0QFRNGfYcnYgPBStPl
         zezuFBCoD8271ObGbsE1G06nmhF63A0x5o53+ac5/HmLqjKT+5s7rI9YwaDKOj36PBWt
         0Gk2DG3Ca3ux/6w1PcyvDxPwwqxvGbZ4Nz5AsExvEpqa1dSN/maXuDnn8BXE5AUAU4+c
         mucQ==
X-Forwarded-Encrypted: i=1; AL+hErHsFbBifuqODrEO6w0adQY3pBVPS3IrHfixpkgRs9w+2r2AljfWuQV+xb2yQZhhzCo6tzeQNwriod2CVXfxiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pativun7HRSKnsQ5tYX14LN3IP7pboA/hd5YUFI7Qz6kxwUl
	1zj3WilowGTz8CBCnC6+qW1rbzXlDUQT4WO0phE9b7sZl97Tr6wDzpGArkAxRusWdQ==
X-Gm-Gg: AZFdTZczjBsqSf3WNupebkYrK1ZLjz4vG68AD0+v9UJU0rXTGlPHrg82zOJT0Kq9CVu
	86tC9PRxVooOjoKoIsHxPLafmgX4ViMQVhLDdOXnaKF7gkH1VSosXuT86UimtHWQifw2rXGQ8o2
	KiZSBq7eKzOAdNT7z7kN9O7+0HrTJFh/+uW7hAmCVxged4IlY4Rb/4uh11iFSvyO/Yjmhbi5q0b
	s+il7Y/jIsoakA0mJTx71Ubvs060JrbJSeGEsCg8uQaI+SUVSfZZ3GqnaEJde0OvsHjmB7A3Suj
	rWnfTYmQ0RMALPGdhhqVISdgJH9r37kokZJyCRq5gCOz6qubq6ENJ9Rxafk0Iq7k7slHBhTlG+R
	sKvogZy1853m5PqidAgsWDgL9YeYX24mgR0ujCykhGtGsfKGxbe/PMZ+1zNGxqav053KXvZLuel
	3i/nfb/cAVgl7X5/idL/gwlkbjgTIRmzzYlhKotl/FA5MO6A59jep2yKlWY+YfzaTj1wva/vSMA
	30ELfLHzuI/PEYfbgstAR0W2WTCwLKLGGq1F81N90w9X7dc+ROJccnakmNQzV6diCQmdoqPRg6Z
	IY1sxPtwYElEpr1wBa2wCopOYZQ8/lNpyLKegAdX8rdkTxv6VcS8cKuMTK1748OxHdxQpueSRxW
	v9lKebfyONbX6u3EKYwjqcs3dcZ691673W0yLA3KXYOjVmdCu4pqvkZRNqZ+1X4ZY1Ci6AE4BLH
	1dtNtSAdNokKcf4QPUnWC6sXr6LYuH44XdOdUNEgfBRxUCgG+FaFo6IHM5w7E3l5uWxT4jmKxuA
	/1nRXqRVMfixooKVm0GZ84R1bXA3PJfbkyyfgtkOizcYdLMPyjiu0IDVxmgKO3ogXb3VjopG2dw
	vNqpmZbj6NdJumZ2iP2mrNhCkP3uQlqbVf0FuUSGSJi7L7XcST9IX8H0LSLyqT/wxYz6km1JtL4
	=
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr440901566b.47.1795302457248;
        Sat, 21 Nov 2026 15:07:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:36 -0800 (PST)
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
Subject: [PATCH ath-next v3 02/13] wifi: ath11k: keep the radios when a firmware recovery fails
Date: Sun, 22 Nov 2026 00:07:20 +0100
Message-ID: <20261121230731.1206043-3-julius@bairaktaris.de>
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

On a firmware crash recovery ath11k_mac_allocate() keeps the registered
radios, but the error paths of ath11k_core_start() and
ath11k_core_qmi_firmware_ready() still call ath11k_mac_destroy(). A
failed recovery thus frees an ieee80211_hw that mac80211 still uses and
leaves ab->pdevs[i].ar NULL. A frame bridged to the radio then follows
the freed hw:

  Unable to handle kernel paging request at virtual address
  ffffff8316cfd480
  pc : sta_info_hash_lookup+0x4c/0xe4 [mac80211]
  Call trace:
   sta_info_hash_lookup+0x4c/0xe4 [mac80211] (P)
   sta_info_get_bss+0x1c/0x78 [mac80211]
   ieee80211_lookup_ra_sta+0x124/0x14c [mac80211]
   __ieee80211_subif_start_xmit+0xb8/0x3a0 [mac80211]
   ieee80211_subif_start_xmit+0x50/0x750 [mac80211]
   dev_hard_start_xmit+0x98/0x120

and driver removal dereferences the NULL ar:

  Unable to handle kernel access to user memory outside uaccess routines
  at virtual address 0000000000000000
  pc : ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k]
  Call trace:
   ath11k_dp_rx_pdev_free+0x34/0x12c [ath11k] (P)
   ath11k_dp_pdev_free+0x4c/0x84 [ath11k]
   ath11k_core_deinit+0xdc/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Destroy the radios only when ATH11K_FLAG_REGISTERED is clear, as
ath11k_mac_allocate() does.

ath11k_core_pdev_create() has the same problem with the registration.
During a recovery ath11k_mac_register() and ath11k_debugfs_pdev_create()
return early, but when a later step such as ath11k_spectral_init() or
ath11k_cfr_init() fails, the error path calls ath11k_mac_unregister()
and ath11k_debugfs_pdev_destroy(). The first unregisters the radios
from mac80211 while ATH11K_FLAG_REGISTERED stays set, so driver removal
unregisters them a second time. The second removes the debugfs tree of
the device with the macN directories, while ar->debug.debugfs_pdev
keeps pointing to the removed directory; the next recovery's
ath11k_spectral_init() and ath11k_cfr_init() create their files under
it. Undo both there only when ATH11K_FLAG_REGISTERED is clear as well,
which is when this call did them.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 0366f42640a4 ("ath11k: Move mac80211 hw allocation before wmi_init command")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: also skip ath11k_mac_unregister() and ath11k_debugfs_pdev_destroy() in the
error path of ath11k_core_pdev_create() while the device stays registered.
Florian's Tested-by dropped, as the code changed.

 drivers/net/wireless/ath/ath11k/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8e4dab61a300..5f4e7fbe0b25 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2073,11 +2073,13 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 err_thermal_unregister:
 	ath11k_thermal_unregister(ab);
 err_mac_unregister:
-	ath11k_mac_unregister(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_unregister(ab);
 err_dp_pdev_free:
 	ath11k_dp_pdev_free(ab);
 err_pdev_debug:
-	ath11k_debugfs_pdev_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_debugfs_pdev_destroy(ab);
 
 	return ret;
 }
@@ -2231,7 +2233,8 @@ static int ath11k_core_start(struct ath11k_base *ab)
 err_reo_cleanup:
 	ath11k_dp_pdev_reo_cleanup(ab);
 err_mac_destroy:
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_hif_stop:
 	ath11k_hif_stop(ab);
 err_wmi_detach:
@@ -2315,7 +2318,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 
 err_core_stop:
 	ath11k_core_stop(ab);
-	ath11k_mac_destroy(ab);
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		ath11k_mac_destroy(ab);
 err_dp_free:
 	ath11k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
-- 
2.53.0

