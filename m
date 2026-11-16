Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795044;
	b=hiAkd8WJUM8YQGn73PVnqY5LkwRTWzNpeaf33+JAZXRiSJLFPC4l0fCSvYAoXpBg4FCc
	 HnlVxMWOYRRzwaIceBdS1PK9lRTKrUktWP7FNFpH6FwPPPwsmLfSwJid8Z5CMUA9e0cbS
	 mHEtiVPohxd8OjrGTmGHYuc9P9bYDWxmiBt5WsupWUpTZ5GEWbyTZuWxhcTorfY+SA74i
	 Q45+hilmGe0ChtJHsXmV0CpFiIlkhh7BV7JoZfzjjeRBGMgPlZJ+lVKdvZAprIi+0Fzak
	 ZM/VBVJCv8xDkUwjdx/bPzv8RgKjrSB5Jo7jxytf/+LUpmiBwK57zA9UdjKv+MOh3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
	b=blr8s2sbzfAih/ggdStSvM6gSv4bObYGyyGg8dkxfC817zvw7ppk1442PwYAF41kv/7C
	 q5ag6JtlK7EdbeAXWZlr/IigY4akwSRAoYWJjInR9Qc20pTe5T8a42753Scaf10rAQ+Vn
	 Jk2FuvXUEwfJ6y3OfDgumKt8/tB2s7GwbCE9ustYSLoOWZ/n9XZxY1pYMEOi4nfMRNCVL
	 RuhV3/FDHysH40bXKDt+7KeOQX/vJSU3HxAvG/Gwn/rqTwfaLZHgEFnjnQUJbxvWzZMw/
	 i6JqIjQ2Lf+udTXoQypaiYiup/IpTJWhO1qOpC8V1oAuipqKkcaOqx7OdMAfWT5bV9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbqv4uHR;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C49606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 02:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jbqv4uHR
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d2f5f1e26so10564201cf.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795043; x=1795399843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=Jbqv4uHRQP54cdnuaL/Q/gZHnXBJRWgXPZVEdMzHxXrdSrN+ZbCCCz67AwbrZxpJm4
         fGrpnwp8q3OyYuqYDrgABdKhzipJJOZ6xePz2HSPn0Ot4Xj4aVqZPec+sjv374uauMnk
         Umb61gF2VZhReJ7iP47Lxha+w62hUf98FrmhbfCQH+o93Y83tYu0KES9RI8ICmKe2Gk+
         XCAP6KoMXNADYt9wp/H/gf3UiDsAsngAwkXHmDVxRx01F5gfEj9lEvRoYFWco06hqbT1
         sLFndp2zL7p4sF8JGXF8gxpKFAQSWGUldN+aXLNaPHoOsV87GZyGe3Gfsp8SNqIwqsYZ
         9qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795043; x=1795399843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8E59MHyWwiA+wcCL4U828xtteetfn3cJcwAEEyfPtQ=;
        b=SI2OVE9Iav00t77I1WLQm9tkjeOln0Dh639WI7up5AMAdGpcsxV+EqwT1xmGqEipje
         w8xp1IOKj8oA+DSKQYy/64eHmhMayz6lwe69zslBLF6xyQqqdkMkDGppYl04drU+Hglb
         ZHHyuWqxGznXj8mczEoalmquNzkF2iz6Q1K7J+N2yeyUp+z3h5m0RPesVP1lLnHU4SDx
         GMZxHxqUE2pPcFQnj8rSsS/mz5EQ8PyrsxhXAUm4vwu2by6wys/pSXlmEV6mW2bdrIvu
         TduYLqSkzOpvTRyNYl7XiodW6cKAIUsNiyeGU83ulepr22+orCKm+E0J4IcJ1tCCym4w
         sfpw==
X-Forwarded-Encrypted: i=1; AL+hErG6nftwVS7h3DuchnEMWOPLRLiFuex6DideHODWP280Egs5Kuafv/oaT3XibMxY9AXCcFbY4X8Cbl01qAr6vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JSyScJdlP9nl03jA/3isA72PHAoxW2Nj8GLiQl7ADdLc7Rspy
	oZT9Fp/dOeNjVOYqkv3MwpyCgy2vKATweTU185SybxDCcyQv3OHJvC+1
X-Gm-Gg: AYBFou04y6BKc0R3/EiJpytx1EtRSgAVnPq+iepQzF5PU020R4n/1BgtzPP+UBwZIMK
	p24a3gAoK4x9IKZ6VXssonS7MfM3sqAys2x4YqP8wR7yj3FNipZ6r8hQ/bEcocqTuOEuifTh+ym
	29k1YPzGluDhtAECEKT7z7Wm3wrWytbTFWL4VfQxwWpnrSRj/hdreRjdGIi4Oec4YUovCAb7pY5
	dlPK6WOHOOQCcY0y0EIRnsi5RhQAzSWv3oOnEgW2ffIZeOYqWMYJJyZxmX+sJBhs23fVQWarrgN
	qlIL6aX5sWbCf0lDQbDsXAusxTYuN9J341zFvvB0b+KIxyLxYuuGgBrImChxBEY+3lLMPJ3LTCn
	ed02SpMhTo5LVSON18DxTiB9f+PiTd2FpPEyWqVvl/8M0qizw/HOYpyuZnG7Yx726ajPzWlmGDw
	/aBvtEv4H1GVXjV0pb/9YILcgr5P+82kPs71k9RY9erk9UQpYfT4mFqCYq8hyKy+RXE04hhbZ9q
	ZH1gs7QwjjycBEWKHSqzoHSGGqAlK588PSGkVOAuFcjFBy4c6NKUPZcWp65JL08ab0T3GATfwOR
	v01BbhCX5F/glmC1S4wMELvca5LpgaB8ezso34DmE7Mex7pG98PZTvFyN3Bw27PCVhEjHEYwRlA
	=
X-Received: by 2002:a05:622a:14ce:b0:55d:30f5:34f6 with SMTP id d75a77b69052e-55d30f560f8mr60276151cf.37.1794795043056;
        Sun, 15 Nov 2026 18:10:43 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm22083541cf.22.2026.11.15.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:10:42 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Jiale Yao <yaojiale02@163.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing pending mgmt frames
Date: Sun, 15 Nov 2026 21:10:37 -0500
Message-ID: <20261116021037.538128-1-lcy8047@gmail.com>
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

ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
completion can meanwhile remove an entry and pass its skb to mac80211,
which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
from the freed skb, and both walks can read an IDR node that was freed
after an RCU grace period.

Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
expect it to be held.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.
Compile-tested only, with x86_64_defconfig plus ATH12K and W=1.

 drivers/net/wireless/ath/ath12k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..bffb2edd0531 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9220,10 +9220,9 @@ static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
+	lockdep_assert_held(&ar->txmgmt_idr_lock);
 
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	if (!msdu)
 		return;
 
@@ -9241,8 +9240,10 @@ void ath12k_mac_tx_mgmt_pending_free(struct ath12k *ar)
 	struct sk_buff *msdu;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
 		ath12k_mac_tx_mgmt_free(ar, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
@@ -9252,11 +9253,13 @@ static void ath12k_mac_vif_txmgmt_cleanup(struct ath12k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
 		skb_cb = ATH12K_SKB_CB(skb);
 		if (skb_cb->vif == vif)
 			ath12k_mac_tx_mgmt_free(ar, buf_id);
 	}
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arvif,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.43.0

