Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802457;
	b=xfUNgHtagIDbUCwGdc2ssVXQWWLmukA8DJZ98OuiYJaasAb9FK6QUQBnt1nSl1o5ZxdP
	 6u1BY+P+WLGklMwylI1rsH02RABXZcBaQhKuX6rRJ2Ru+mvRM6uHMAjO+BnRAP6cx5i0a
	 2NrqSsBEM+tf5Gg4AhT5+3IudKYtL4Uk6QrGXrobd8j9AP7Y4hJXdJDsmtNxLGup+gwwq
	 rrS2PXGl0m9yrlE/ZLLD73crupospT28SLLMQGI96u1BIHa6n3WMcFDDiaKnVV+xvzql4
	 Ts7HvxqWLyj5kjoQCb1rqURsGCxmOh3aV5GeLguVSp6DvZt+As0AK3iV/taTaIs9JnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CuqpNv9H41VXxORaYTmPyqChWP227yniBdgSmxmSXGw=;
	b=hhkG/jbIB9mbVBeylUCfpVxVgC7qR+e4slcNsi57Jgr6DhzQZUokFin6O8ng5P4u1vuO
	 bkxZ3XhKzbboVlf5BcPNBsqK707/CQ8liyH01quCvoChEaZRbs/nbAmQKEE+o2HFwzHGF
	 ZU6INIGRSN3IFS0W8pm9gCKWUDy6OfaMI473HY1G4mrTG9VstyR35jUcUJjM7HbbObQ4k
	 KMIVfP5srhcTDeuji4FJ6ZZqZb3g6OSNEyIwZY2yGjN4D05pPnw1piVO182SUjS2rWXwJ
	 O/KjUSm0lRxDdDSrM+bGQ1d5U+lcId4L6DPOwu4e/mcoBWLexFrwmt/Kzl1jHI605VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe9nRld2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF023606A31E
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF023606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xe9nRld2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38431138772so10934941eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802456; x=1796407256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuqpNv9H41VXxORaYTmPyqChWP227yniBdgSmxmSXGw=;
        b=xe9nRld2lWAssepuqY7i+KghgvBcrGNbWFUBdoIafRwScm4L0V88U4nDb/IZY14FSa
         IxF2CajvLTJRVjMIs7CyjqZly9MI5DgWxt6S8YVUxKFMu/A+iuj+4zfYZfSorkLfAs7E
         u3i+hKJYWOtxriObnFcT0UyxfMFQUKsq4oR4qg0EUWO2U54hK8Wpx/RkZ5nD2tdTJk8R
         ExWBcvkIROnMB3EaA+TUuPN19LnSA101aFuDcTnp30wpRuJ+BTPyxezfPAUImTEj/BDc
         oOlgRdm+fnyN+eMHCDtpaxvWvNpdkipW2ZMObBkT/wrNtQjLcaB1aUzIiS5DdTMQZ6/V
         5beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802456; x=1796407256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CuqpNv9H41VXxORaYTmPyqChWP227yniBdgSmxmSXGw=;
        b=oWttGWEm9Z4Jvk0m0tmvQOUTpX3fKzdL5uFasZV2thxvaeYcqOyzi2Y5ERXk9jxohr
         WNrBxkHXpHj1Bqx5PpfkoAAtX2/vyOMOBSHr0hfcGug7UwRSEQClncS5RfutpKT3MRGw
         tXLwzpwVKvpKwZ+21Rq7BPDxoew6u/hbL9yvrepT0m3CsnewDcxPPUHejqimgBwN27o5
         FDQSyHh8pWhL5/3+3+IOQ4S34lUZbsg0IYJC6+Sdu7ViTnZj3os5HNmkzEbEhEz+5TMG
         KDg9VFsonS3CAke4oWMQNAggld01N9cq6yzwLFrpeEJ6H8i4F6VaEmcWEOZFeuDYAl7D
         FvXg==
X-Gm-Message-State: APuU4Z9W5DbsAoLEZLSpnmwfOLlGBMATJgpAKOeL+5l/bOBU8/wzUhPG
	/q2w4z8jsuiS/OfjaicFRFsYOBNG+r/L0QE+Q57uTHMATplMHaNoFyUTBS2o5GK8
X-Gm-Gg: AZFdTZczD8zCTPgBM2FOJnhlOT9HSdYguVO5QZauKX6YTzNCuSXy76DgB6legDe/5Ak
	L2GW5rTTKfxBE+lctS5sMea83vjhLHmquvw7TWRvm/yDKbTSueN3LOyD4PVcXk9xxWnZw5WLuZS
	jFxx5SJ5s6IdVx3JNUroPIMVWIBtz5Krpxr49+M4BId/Ryo2GHTEpAbt77hV7+l2qEYwm0KlU5z
	u65eGYGH1E9FnI/Bf372Qgmts3Vz1a0WvjPT/+qXyt0JhZGu3gMGkwgAqcmLqQc9QUsPXJgdBRi
	ppnAYDgYwk7peP15W1q8Se8eN1zmU/lNETGBWUfkrlsfQNdbGtJ5ewfucEQpVR9zDSaJmgH3yDs
	Ez+F20vuZ3BpYI5PQgJ/T3impDWHZU1VCdGY/MxtByu4jJ//suQipZupNgjSHfccfBUiwlq09Fy
	MBhO3BoW1AwIv7UraUeJgFGVbNV7LmjxJgkeMDIbuiz38736Y0s+BAdJrSn9QJCQ2xrRGeJMhdL
	lQ6o5MVhZPTYW+YtROmheqNgG+1pubwgGw9c0PMvW/bEK9u4PdjAQWyQKC+ongGGtNedwM0mWpK
	0J25CyeY3cYgykMYYEhwQPXdofKKFQ6tdexvIhrJ6pihXswYJTOPRke6f1wSaNmFQgIK4qL9WeH
	yaZkJ3QTKUvA8ENl/yQ==
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr27808640eec.22.1795802455630;
        Fri, 27 Nov 2026 10:00:55 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:00:55 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 2/7] wifi: rtw88: skip the dynamic CSI rate without a cfg_csi_rate op
Date: Sat, 28 Nov 2026 02:00:22 +0800
Message-ID: <20261127180034.1058591-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127180034.1058591-1-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com>
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

rtw_dynamic_csi_rate() runs from the watchdog for each vif that is a
SU or MU beamformee. new_csi_rate_idx is only written by the
cfg_csi_rate chip op, so on a chip without that op such as 88xxa,
an uninitialized value is compared with cur_csi_rpt_rate.

Return early when the chip has no cfg_csi_rate op.

Suggested-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 6bafda9138..2064a6f6e4 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -174,6 +174,9 @@ static void rtw_dynamic_csi_rate(struct rtw_dev *rtwdev, struct rtw_vif *rtwvif)
 	u8 fix_rate_enable = 0;
 	u8 new_csi_rate_idx;
 
+	if (!rtwdev->chip->ops->cfg_csi_rate)
+		return;
+
 	if (rtwvif->bfee.role != RTW_BFEE_SU &&
 	    rtwvif->bfee.role != RTW_BFEE_MU)
 		return;
-- 
2.53.0

