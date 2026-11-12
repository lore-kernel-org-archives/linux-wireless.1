Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489281;
	b=r4k76PuQBQ+K2IbzpVhOPBMPhYKF2W6QWqdLOlaG5CLSCwIw4MRANSgWy3hHb9ehVoEK
	 3RW20DK4eAZWzgYqHd7d8hr1yMdGWamTBFQ0jtQNqHqOOZ55iKEuYmzoccLTPtjCSw3mc
	 /oHd7riI0F7VvTH9vqVDgb8AQAgujZGTR2ZgPWQznURbWHn5cKUGdPNjmMcLjERTRSbO+
	 7clCVbI1JytxuJWAKtarCdufVyWbpJauu+5mo8P0KavHyp4n8HM35sA8YAdrjTp6Dbxe4
	 EgbaKXC9UkQs9UyeLCC+SwEPMniyI/nBuLTfXNUMTl+PJdXwhzykbrM+6XmyGdya8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
	b=eeWX7mtymOD7x/ZzqFi8Wg63IH/HvZkjtgcQpnuV/mhrnu0iTr6OBIT0I/mksgdfzw/B
	 GlhMuiOv58NKugEGPpWSEgxvqD4WUIJO+7rJEibig/hkpMm20YWmQ89yUqzh0/zccsWhd
	 v0wHgM973gXRtPXo6KAC/VArJoPSUVWsR5sirDav/Ji2llWPk/NmZaAFO5Iyu7HVIwuYP
	 e2jNp8aY9U92Z/2tObISY7lzh37CPySEe95yo/satSRSo8IVG4Bu5lJ78fw7eoP47mVRc
	 2vRgRZ7riyQ83vBABF6zk2AYOqjky4Ew6nIrDDHDQDdWshdbr9qjS+8tIBtbTKyhCHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqxmhICb;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF41606A88A
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF41606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqxmhICb
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18818daa3e7so397124c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489280; x=1795094080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=NqxmhICbTIYcfGuXIJz1P6XnftDanJtNo1IcpGIrdtTtROTY7LSHAsKlxtR1mLJjkV
         DeJCGFOk/0UaAA5YZUQqhxbdhU4eVd+oxCqDdarxd/Z9xrtnYzTjwP8fhWX0L2WJOfxB
         wrT8sFQ0X4/vfD5buGCD5n1yGmvmWxm+KYAOSJ2G3ik+NEhRWQmGZoaw/AGJz1aR2xeu
         w18NVhyrBFhXIypj7bT5NYU4WolJoZ9oIofbV/tDVHMWzUU//90qy22fS1HeJ31MtAAL
         otzvebmGP6K9gHj+Ym8q51sw1yDljXNX9ltgpi1KZeHNhpOTK5IpyiQJaY4E0pW6eQZL
         0mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489280; x=1795094080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=zcaYGJO+9iI+PcMri2b/B+IGCmCVGtek9kdaBwaPG3z0NMrjV0ROnyplQY4SfiywFR
         lgSKFuWfPYEGxyb0t3bI2qltqYlnG/6SDfTfDy31ne6LbAoHkkWkAPxfto6Riiimvutb
         qN5YsYEZEpNH2jBi2yjIx7xnFWXrRhut92DKGcYmt8h0Vn1t05S/4xWpEbebaplqj0W9
         WB6+o9f4RfCrslTNIjSfvrFi7Z3uOScFw2MOQZt3i/EveGSxEhLlYvQZ/mQVKW7H29JL
         u32hVHYvA2notJe65n0VD+RCi15Ax0N28hS6f+W6eenL/AMzCbgdIwJLrA7xPLv90wMD
         fjuQ==
X-Forwarded-Encrypted: i=1; AL+hErHxn+4EoVmc1Wc2M/64q9JFizh/DGQnf/XG+dAkiCzjsC2idiSisrWE4YAfr+ZYQNAZ3o72Z4tMhUtbIQqa1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z95b6RhYPbYY0bJ0lJmec4BXTx2g1lB4psdZj4UdO8RqGScXLoA
	haL/bxJiHpHB63vMB8yJgMCYLD2iqpeaqe/39exdlQ4FLWbWSySSCIe53g83X8CT
X-Gm-Gg: AYBFou3UHnkZehl9PxlF7VyN+mPgPzZ9SuObnn2+2ce6IRpbaf5SQY6LNyjeE46O4OP
	dbMw1sRvaf7AocSwBd6BHSiIGRvS/qX/ZYKqMdlIixiZIu2YypJcRZ9bp2dhEUZXcaPICwRXFVZ
	eB5Sa9nMARoES6IHOYZavBGLCxxIs6WiZN3IiZ+aVtr9TqS7oEq7cFk3tLPtbwwolPyHVHRtWK5
	jEpIFIRmEzEordxumDOOKdXfZ2FaDuIxl4hvgTe1DRusGF4yqv8QEk+BCnVQQfn3go/xRVuQYRc
	Umj5FQiHPrDUNh/C/c9KjKn9d2OCEc2Jm7/ovqx5QCJTRyN64L5tp0MJYSt8qXgBk9AKPoQUjh4
	KuA0ISxp3Jvk8FFPPEAb197Pq8ZWhizcKCS0Z6YadSCx/ijHSfa6q5Vbhr1YU0p6poOUDXXRL5E
	oHnJXrwyJ2BtHewk9q3wtH22/9gccStN3VEKIYF3yfGNF+8lRFockKOD4LjLQj8pIGLCBliVKuC
	hNw9xDfl/m8YJN2Ywx25zCAwJKB76BD4ntfLF06bZqSPBgSDcGpeTWAbPRi05pQkaXwcxoy+i+8
	Sr7Dikf41Z3daytNwJRxFv8=
X-Received: by 2002:a05:7022:b0c4:b0:194:e9e5:11b0 with SMTP id a92af1059eb24-1b4f5f37813mr2187785c88.14.1794489280241;
        Thu, 12 Nov 2026 05:14:40 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:39 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Thu, 12 Nov 2026 18:44:00 +0530
Message-ID: <20261112131401.236433-3-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112131401.236433-1-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com>
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

During firmware recovery, __fw_recovery_work() iterates over all
stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().

If recovery is triggered concurrently with station teardown (such as
during ieee80211_set_disassoc() where mac80211 leaves LPS before
removing the AP station), rtw_ops_sta_remove() is subsequently called
for the same station. This causes rtw_sta_remove() to execute twice,
leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.

Check si->vif in rtw_sta_remove() and return early if the station was
already reset, setting si->vif and si->mask to NULL upon removal.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..a74f199a93a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -384,6 +384,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 	struct ieee80211_vif *vif = si->vif;
 	int i;
 
+	if (!vif)
+		return;
+
 	cancel_work_sync(&si->rc_work);
 
 	if (vif->type != NL80211_IFTYPE_STATION || sta->tdls)
@@ -395,8 +398,10 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 		rtw_txq_cleanup(rtwdev, sta->txq[i]);
 
 	kfree(si->mask);
+	si->mask = NULL;
 
 	rtwdev->sta_cnt--;
+	si->vif = NULL;
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "sta %pM with macid %d left\n",
 		sta->addr, si->mac_id);
 }
-- 
2.53.0

