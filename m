Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979287;
	b=nwLed2fQfPvWVKQQfkhqqZf8Rg2HPRc1cetkZ3E+FTtx/zDS9ztmsO4hsezsvTvn1ymJ
	 87ax9zT8WfeSCaN0iYEl1DN9auW2AtqmEKqQsuaw0dQq/QHE+fKN97rgAH1Glg3e/IkSl
	 Vtlj0MUb8q6jqHLtEJtUAm19Lzg1KHAiaXGDpgZzEdPe0Uh14ER+lOS/A6lQvKj/dTu6O
	 XditKvqI1hwmfsrroW6ZZcfZi9fLHyVMNfsuVjFnk8TRgRCUAwL53/bxUoWEVwdd1rGy/
	 IVeNRAdCFr7Ue6FFY/2fCWUG48krSdGIHmBWBBQKwqshroLlhJlmRlMTRVMJ8WCmN8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
	b=k79zQsEAtnSuV3Ja+L/oCKHRiotgfiINdEsZtKGp089BEXN14OS3oBXtPQZ7ehZtz/AL
	 HGJ961akPBM0CcFtlDve5pyHqG6IoQKrHhRudiyNAaDUkIxYI7RCDcS87eKJvAOPTHj32
	 1/m8B70zpuxz7qQa1kNjIdsnEemQG5KAne5OeiTNoPj+0/M/HoffL+wITJFHqXtOTJ0tE
	 nl2vJrtf4LYtMH3hQmOzEqsk0gyebKTU+k954PC56iMtCodBjWqpxF3EAn60Hp/CDToxL
	 1XZFo6NuKKPaCZuUlY7hFOsclCyHH2w2d/NrPEeMdWOUpmE5CTm/XEama8z+fHPxJTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdr7GsFV;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C883606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 05:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C883606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wdr7GsFV
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f1e5d7450so59236985a.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 21:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979286; x=1795584086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=Wdr7GsFVFyPw1YW48GX/9VGp+rzxLiG8QI59PmBRBepuKn7sryXfTEUwGVEi9driat
         ZMlbSeqecaUyiLWzyYdD1Z9jbRJHrpWfLZJr97yy7+O0CgDDNwmCSYYa5PCR8PXvt/QE
         6nA3LHK6F6QAGm7SvWLwN7uEJ6UyhLdYe386Cy9fxh2KAoXCQCsSw9ElurZsMfY4H2LJ
         BleWFFkf+u415vFs1kwsAaShWwYhd4SOOgfxnYltHscMv8KqFFKqRGDJHpvkoCFa6xZd
         1xeC4p0PYyc9WAGAfu73M1squLzij0Uu14AXnXkoR4gSB4c6rb+OBoMXPFn7SVEtKkF5
         TjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979286; x=1795584086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=hpdpszx/6chmqwhJrtwv78LMusVT4YTID0axiODniU+Q4VxQyuyq5jrQh70zjabmeT
         LLpoWdkE4Jri62N117slgpLTE5BoksUDYUcUkxGbZJLLBnQHE4cXJOu6MP8pDOldi7sY
         gCu/Bvy7TdLbJnJMMxqjDvnbHqKpmhBqTwWiguhJ+MpGkDnuLTuakmTpvHrc9mMGCF66
         a/T9vVWLRipGx+DgYYglwT5dRpniSr7Eyd3kwQxQaSUUUHND2KHQkwrdxpc5+ysG88b/
         xWPrJsVa6Vh1980RFGD2Rz6qbp0RrQPu+F57cQp25KLp0ybZ9e8a6G631gmseuCH86Sj
         4axA==
X-Forwarded-Encrypted: i=1; AL+hErHE9h4nax0IILyck4ia9iFYtgtVYFRLDpm2N9/GuJ41YAwuy9VqFvr8vgcP+2OQDHvaCOAlO3yJSdOVN5O6Fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ng3Q6KMJzA5cXbfH08nVPotbpG2RMNRDgqPdg8EbDgZgQwBV9
	JON0oY9r2UgPPJOzJrhc7yWj6zf+6K41uhp3UTAFlWocbZwxwrMpRbUU
X-Gm-Gg: AYBFou0L+O0qMwJI1bil1Vb5/vP7HUmUEWYgNiuadm+Sbx6By0cUSCsoYJjM3/oxTwi
	UcCsaJm29Q5GTPOeio1UtApfMave1OObnmGPZyiRwZiDh1Id0fbfNz6x3yNW0Ny5Ht6s4j2b+Q2
	D7Unug1YhNog5TKad+2B38lzvoXNrcPA0JRVxvl1rG9OVWy1/rr/S3qgDqtVpL0Pf9V2XEAmSHJ
	3sA5zNZIePnD3o72k8+a28auylRw+ZPEz6e0pR9UCnheYv1ofcZJXstdPEWnYeG7gUYIllf43JQ
	NZr7rbxbyucpnLQGLhXS25kXgBH14T1k4Oo1szkF+bC3r70V1rhpIucbl0iGvTLlq5mPxExX4vB
	OwYCOstiBB0Qyz0A6+I4b0X8zrwviboVEqCouX2FjFSUdpkX9Kb2qXzIUtjgax0RAbBwgUC2F+D
	xQFRchlWkMpe21rR9gEykoE/rxHNDg6n1DGO/U+gLxg6tecV4f66CJW8BRiz3RWZEa5JW3Lxag7
	DTFf45ZdN6/HdcmF38BOllwXMDbynjt+MJLKJAPlpOPVawy6ettNBuKI5EDkD60XmmHPvFqiR0v
	OnXC0Iw2yXLdeWv++UhSe7UFIolg3ut39gIxODi8tYj0vf/VdSjmlsVreGwfcBk4bVq97tHFQZU
	=
X-Received: by 2002:a05:620a:8710:20b0:949:99e1:42d7 with SMTP id af79cd13be357-94999e14369mr199935885a.73.1794979286447;
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d9b579sm12305296d6.38.2026.11.17.21.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference when HL TX fails
Date: Wed, 18 Nov 2026 00:21:16 -0500
Message-ID: <20261118052116.3901761-1-lcy8047@gmail.com>
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

For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
htt->pending_tx and takes an extra skb reference that
ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
fails, for example because the endpoint has no TX credits and TX
bundling is off, no completion runs and both are leaked. After
max_num_pending_tx such failures, msdu_id allocation fails and no more
data frames can be sent.

Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
path, and drop the extra skb reference.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
and W=1.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..b437b09717e1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res) {
+		if (ar->bus_param.hl_msdu_ids) {
+			spin_lock_bh(&htt->tx_lock);
+			ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+			spin_unlock_bh(&htt->tx_lock);
+		}
+		dev_kfree_skb_any(msdu);
+	}
 
 out:
 	return res;

base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.43.0

