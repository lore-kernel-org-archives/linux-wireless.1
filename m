Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196126;
	b=PR88ubfRR0kJ/N0NCNbJTyRb6BH4Tq0W0h5NLoaO6KMm3c2hwhmtMaBbb9WXBnQDjqEm
	 dVtBu/tk/J8xe9uae53UnG+2FwTpwVM9UnWUrMG/ABAQ5Uzz5mKfQgmldWcxjj7wJouBd
	 qYPTmHZ5SnmWgdKXuzFniFWfpSW7JiootwuPCGez7kFHL/Gfy0eSYonU7+GM9HlzJi4vv
	 tSsF4AozsXL0Lnt4YPcJKcogEFjOUqdbjL3JxDLQP47za7k1pwFlS++gx2O56ARxr3aAw
	 zTf4E6l2NTg8KI3RfUjx8td5TP9wGmDiL/ROMZZC660XarrKawYI6hMWAhmiGAbIvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196126;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=4fqyV+IxCSlliAT75SUkyH3zRm7PqSfjFRkVtWXmgZM=;
	b=n0rY29nvgp+uMX5cbASmMUhxtZKIFMDOAJ0WiSSQzxS6acbNUG6UuQporLBTejYbBR7t
	 o1PSVbhqz7zkSGbEgejvXFC25R4T4Dr33FCrQbb3jF3hS0nFr6lqOvwTBz72Ve14DATbR
	 wgtNlzy34pmAZKE2IJ3iF0vt7J/RHCG924SpjnrDqo66tBg2LCRCGoi706KGdDXDAWjSE
	 AttGPVUwPF/WkWehqV/OP9j+/HUGEO3o/c4Brk+nQ47vAPI3A/AWxaZTpR3zXmrUvbd9B
	 PrrV120gODWSgXGrxDkpctODkbYuS5Lcok59nZBGPkpuN0ximJJd1QBb1+xk1/h30iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hItw551M;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011BA60A2602;
	Fri, 20 Nov 2026 17:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011BA60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hItw551M
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5573c0abb;
	Sat, 21 Nov 2026 01:35:18 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath6kl: Fix potential firmware leaks on initialization failure
Date: Sat, 21 Nov 2026 01:35:15 +0800
Message-ID: <20261120173516.3923881-1-liguangshuo@mail.sdu.edu.cn>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1fa06e40303a1kunme848b2bf238b70
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkpIVk0aHh9NS0gfTBgdTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hItw551M9tjpHakqQ/ocqdgQdO1oZPXKMS26kpaXejLrYaJs67r1BZh+YBE/ti0TroQi7eqO8SSW33X7IsGSaVJjETW5zDKbPAEGoXllgSfTQGhTwrPEyyHlTRP+HOpMpCEjzZetheE2nyJjhjY0de0HGAcL3HSGeY8Brz5NU+A=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=4fqyV+IxCSlliAT75SUkyH3zRm7PqSfjFRkVtWXmgZM=;
	h=date:mime-version:subject:message-id:from;

Firmware loading can leave allocated images in the core before a later
initialization step fails. The initialization error path destroys the
core without releasing these images.

Share firmware cleanup between the initialization error path and normal
teardown.

This issue was found by our static analysis tool under development.

Fixes: bdcd81707973 ("Add ath6kl cleaned up driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/wireless/ath/ath6kl/core.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/core.c b/drivers/net/wireless/ath/ath6kl/core.c
index 648110cd313f..fec0e1ad9752 100644
--- a/drivers/net/wireless/ath/ath6kl/core.c
+++ b/drivers/net/wireless/ath/ath6kl/core.c
@@ -63,6 +63,15 @@ void ath6kl_core_rx_complete(struct ath6kl *ar, struct sk_buff *skb, u8 pipe)
 }
 EXPORT_SYMBOL(ath6kl_core_rx_complete);
 
+static void ath6kl_core_free_firmwares(struct ath6kl *ar)
+{
+	kfree(ar->fw_board);
+	kfree(ar->fw_otp);
+	vfree(ar->fw);
+	kfree(ar->fw_patch);
+	kfree(ar->fw_testscript);
+}
+
 int ath6kl_core_init(struct ath6kl *ar, enum ath6kl_htc_type htc_type)
 {
 	struct ath6kl_bmi_target_info targ_info;
@@ -123,8 +132,6 @@ int ath6kl_core_init(struct ath6kl *ar, enum ath6kl_htc_type htc_type)
 	if (ret)
 		goto err_htc_cleanup;
 
-	/* FIXME: we should free all firmwares in the error cases below */
-
 	/*
 	 * Backwards compatibility support for older ar6004 firmware images
 	 * which do not set these feature flags.
@@ -252,6 +259,7 @@ int ath6kl_core_init(struct ath6kl *ar, enum ath6kl_htc_type htc_type)
 	clear_bit(WMI_ENABLED, &ar->flag);
 	ar->wmi = NULL;
 err_htc_cleanup:
+	ath6kl_core_free_firmwares(ar);
 	ath6kl_htc_cleanup(ar->htc_target);
 err_power_off:
 	ath6kl_hif_power_off(ar);
@@ -346,11 +354,7 @@ void ath6kl_core_cleanup(struct ath6kl *ar)
 
 	ath6kl_debug_cleanup(ar);
 
-	kfree(ar->fw_board);
-	kfree(ar->fw_otp);
-	vfree(ar->fw);
-	kfree(ar->fw_patch);
-	kfree(ar->fw_testscript);
+	ath6kl_core_free_firmwares(ar);
 
 	ath6kl_cfg80211_cleanup(ar);
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
