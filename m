Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302471;
	b=TSj8devme3SxuJJwFx+CMpLoTjr2j57iBXdnA/VngeUC0eFwmWPrXQkt+Ha/6bmfB6WO
	 5idwx8dbNim6fmEaNm7ho1iroQDg5ZvQNZqMMBxApvxwxDdOYpY/7Xiv5i3EEK+v3IQ7y
	 LP1uHgh6ypvYSujhw1VSWo/stIW5oE/oWxf/AyW0W6hHC6ys3Qe3+Qiou0njU4zjjW7iM
	 OeJCkUzStm7OTds09tAKFuTHngDHokekIh1987aL1SEgjr2RVoP8EgRPe8ECOX7SLJaLS
	 MuzatVQrY9cQZZgCBNI/aOZlY9qNmmvQW20Ku+PrBBPqk30JbVb/nLoH7X5cWgq2hmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
	b=HuZ+Si8V7sxWNOZvXJfcXJdZocypIfErvl0VBweVxuuZJ/9k3zI3CxvCxxLae7mpya3A
	 WyEUpD1TU7unECFh0aGPuZsM6EQcH+k3w/hoai+eHErRMVRiVjmotQWbLiZ8TPGHP6u9m
	 HV3G4t2qd3oc0YvN4TCXNuvwtN9oU1jXomYcGxYAELlW3FxTRIEVo9V3QenPuQVLvLwJf
	 Lxq8lCmRlNOHUpSh62L5Equ/cjspviCEAT0d9JkjrRiuSieFJZREhABJ/3/9VrHIsxYcD
	 MBPFwoptVtjj4pHfNuJiksJzkKVCHk/SRvHzENlce76inPtcA27FDK+Pqn0q9ugqwXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i+meoJfj;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A6606A686
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324A6606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i+meoJfj
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so2841660a12.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 15:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302469; x=1795907269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=i+meoJfjw67kG37zzbxyTSd6hvDpHY019EfJMc48D6DqYE5B6ujS0xSXpt0jKLw3hP
         AKp3vn9hFue7ICWpJfQufVTGM4ZYqoZFQmLCm0P/futHFDImBFjt8NwjuckZsSyvt4SC
         HXoBaGB2ZO6xwUi8BLFefY0tDSnFHLqIf4ws+diAGqR+Cme1X6u3lPxHo9gMvlsI3wxQ
         1Fjy5H4Yjv0RTaPY5AYCLh2BvppVsluWlqcL+ZycsdWDgmzpHHhPt3ojlc5+6MYyFJMe
         QG+KnutGYDPAod6wXfEOw4YaYyXjeT86VTd4P153WntU8rUOge1v/KC2iXOMHsRnbr40
         0b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302469; x=1795907269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnwF+oS5w2IlCzPszI1C/3O+0i/sc/fD9zkOECKdkbE=;
        b=nvFWSG8vvec7rmagT3MFinUWTFbdMvQMA/AVjL5X1YFtuz9kaZO+/cO/vqWNIrzYT5
         0CB9jN92+6RA4u8OGDJMz37UBB644aBjWyN2Ie14N2fGMqkvGR+XBCL/ROd2fJZ6ChF3
         3qyp98Zhsu2bZlezNTWHQsQv4uL3asB0qxD73NA7lxK6TJbw0pKqqp3sOb6ZQ2SgfHEQ
         TO8MWyq/zC0x/yqyJPHTdtzW2hf0d5Npoh7rzQ1yXJNtca6PJUvkIlgG4yCw2S9HhoPZ
         BzjHria0Lb3VkTppEeB/Rf+qgvfN8Q92bC+QTBYm7AkEaw56f5cxdR/nEXIH9oQHlE2s
         2Zmg==
X-Forwarded-Encrypted: i=1; AL+hErEBjCR68HmX37Vk1hQfoOwW/4b1RNO+6o1J3Y+DeItpPl62zMUJ5zWw2PZ0jxazrjluiF90qKDBs1rqgMJOuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/seqXvS7gaTBkGBF4jp1HZ0/zzrHVGWAxuIg6wjhdERlVz3vPi
	HPQosxjm5h11c2v/vPt3pBfMHeMxjW3I9/z1k7MkYQ91lEWEh0MzkGMS31sh2cVY3w==
X-Gm-Gg: AZFdTZeLP+/OJhg38uQpWx+YduV/kMCV5D/RJQqxl8HSqEhG3IZsYjmlTRkD5FuwpzX
	m1UShI86b3hhCBS2InLv7R83mJtwrt6ru9d0PqsstvwxOF5yIauGcoyDzEDY3UuxfPEpDejISNX
	4cPCns/iMT7LOzh+VgNhIVPh4Vg04NlLsID0ljJXZS1+ag5iGood3djUdXm2NHRNsj/vJZIWD2r
	QGCLSWBC7vjAubYSXQ8WidBhOe/apBFUV6I+R75IUv4Ty7BzldCZv3VpAs7xu501XoKyEJEyj6g
	U2rIQnglX2l5KYB2HYQY5zeP0CaCj0fRJGrCy53qX6ASDGZuIktNj07bgRjt5HWqx1sKtCrI8xp
	4GIrjdiue1CiigHYiqjAPUC8X6PNv7BNyFPnyv68oXAyxLL39sqe6Fm17/SaRzIDR+W/Y+b4JtT
	x5zXtVvQXKpURs5cEII11VR7VlgGcijA7UKsbVungpFEXHWioGcz1U+eeQN+pbCg1Dob4DmZGCy
	S3aT6iiwjFkyK3+yRENLXOM9DeiEYGHIKCi53kKyKxpo5dBhHPR2q4VW+AFzxFb+weW7MCqGcll
	psGVKgRhvXGPOu5EcCi3SxrOTdRb2a+bJhfMMNUcVYEr7sOiwIyhoIQRucCZupjBJNvhtyP61KA
	8kSL65SAVzdlc5PZbUlfk1WAcUF50hWejZVYq6lgJ31gbCmx26rGtK55zI5FxE9L9fnODrudYSE
	aHv644kYESqVbduxVvSGFWbfrG3aA207vJ7X21b5EtRLGK9oYfkXEyty9GX1YNZtk7gp88kq2zY
	FfCfHMdgUH4cNhhL0JZgFj/M1goiIhsdU97JJ8GuqwseINYED8BWRoCk2FwbY6cIn1jn6FtbaA0
	DBy+cCnqaYovxyS13MV+VVgRD1MdIV6nf0bnOLjkdbvKi60kfP1exrKSHHSIKkzsRYeSegTxYI4
	=
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr503984666b.24.1795302469619;
        Sat, 21 Nov 2026 15:07:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:48 -0800 (PST)
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
Subject: [PATCH ath-next v3 09/13] wifi: ath11k: release the QMI handle when the QMI service init fails
Date: Sun, 22 Nov 2026 00:07:27 +0100
Message-ID: <20261121230731.1206043-10-julius@bairaktaris.de>
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

ath11k_qmi_init_service() returns an error without releasing the QMI
handle it initialised when alloc_ordered_workqueue() or qmi_add_lookup()
fails. Its caller ath11k_core_soc_create() does not call
ath11k_qmi_deinit_service() in that case, so the handle's socket,
workqueue and receive buffer are leaked.

Release the handle on both error paths.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index aee32aec8732..3ce7c4e5c51c 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3334,7 +3334,8 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	ab->qmi.event_wq = alloc_ordered_workqueue("ath11k_qmi_driver_event", 0);
 	if (!ab->qmi.event_wq) {
 		ath11k_err(ab, "failed to allocate workqueue\n");
-		return -EFAULT;
+		ret = -EFAULT;
+		goto err_release_handle;
 	}
 
 	INIT_LIST_HEAD(&ab->qmi.event_list);
@@ -3347,9 +3348,14 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to add qmi lookup: %d\n", ret);
 		destroy_workqueue(ab->qmi.event_wq);
-		return ret;
+		goto err_release_handle;
 	}
 
+	return ret;
+
+err_release_handle:
+	qmi_handle_release(&ab->qmi.handle);
+
 	return ret;
 }
 
-- 
2.53.0

