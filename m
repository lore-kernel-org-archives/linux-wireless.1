Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270094;
	b=KMLd2G2B0/EXZYsczZixci8v7tmfsrHl3+eNopXpfOe3X/7x6nFquEHVwdgV12iYfxJ9
	 3OZxK2BQB1Qd11IguSakdLqUoUZn55QCeKQVEyLuY2hxjBh763A+WuYCF0vr3cnvv5Hzz
	 UgeHDx20Nqm9Z/HeVuiv5ym+D1zhZMmyf2SOI9nhHtL48hmcUJD8Fe9o+070gxAnN04/T
	 HMTKD+GzfkQu4EhIVEZreQnHHSbCsSr+BwUCgeH9xhm91XlgcT2mBxa/nHgGwjFNjVd4z
	 EOqPHxmyB35znI9QzAUt7ga79RzvVRw9WXqT2/auxDfDK2I7HpjDMg3WRle1Jm1x7hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
	b=LUooUvSBwnkkki10ERO0zu3uLmaQAKTcYnvoEeG9PDWC1SndAjFPavPU1P+nyPjbzjd3
	 Gci945XFYm1rR9QvOCBdaj0gUvbBkvTPtm1mtjPY6dyhdjJJJ0fSxER0J2P44/lkmnUBe
	 MwJC/KtPYzVIS8PbsECmARR2qoRftrx0sifFvuTUE9rEPDNaiPE4W337IO90gM+apJAuf
	 s+u7mOMdA//3tvsAgnYLtLkQs/oPZxfi6NPKz1NDtqKvnJgquY9rDqIcwuKK5EgsDvTnD
	 dkiounXylAb0lELBs/VgXHTGKUnzLiMhRvMcl0J6iOWjJvRaVBjei4VZ/UGvzckr4QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRokZ+48;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A5606A332
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aRokZ+48
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9964155e9.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270092; x=1794874892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=aRokZ+48va9to2V32gz9kMZ7zCWp3sCon35J+gdIngvy28JoKGd/3aE0aqp3xEObjh
         E6CnaNu6h2mE6qzRR95Jhins1UA90WzI1wt1+l4zDZPWQGAi1TpeNBSu/uEDwvBbLohw
         0UYR2gcvuYpuefv0ErtgxnToIWLSZtTuELMer1rnN+gwxP7uhPFIBEJUnbCPUCMumK8M
         IJi5+JeVxCoklrqrZTiREr2B3KnLZInvnEVC1blUls136l0D0YgSG46hx0ykr5MPalE3
         jdabMXy1YXASjqyqkdzrp/4SUXahby1fGJhHzGT1vAYTUEIHn0gl16plwoOC5z/jsZma
         eGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mprZ/SxCZQp3vJ9FoySHalmt9PXMmx4H4EuLDGy6ZJc=;
        b=uCb2n9iQA0ksSg5uNd4OrTeG0td82C/AsdGDS4cZt3rhkcKBy72ubbP41rkezq1H1e
         eYvKHpHEAxN3JCH/eCRmipglO1y7z+9ffZU3w28onT+lEwspqKeeJxjN/b/hUFanzuIR
         k3AxBxPXQSqR42elLTK/keYYkt53Dxiu1dQ+QZnCtoKOahXHzzUXfScMIx5WrqZVUjus
         p7pnoZaNL8dFdHLB+qiW893H0cOcUWaaOD4O0fQvW8vJr1OlJdNsu4VmFtE2oPART1Rd
         T6S6K+B3vHpwvwQD+bC3euLD4C1yAQYDAz4nMkik59fNAbzOfdbACK6rrhhecWySk5F4
         zihA==
X-Gm-Message-State: APuU4Z+XrmcRgPepFNEmZpcqC68d3gYXW94gb47tEW2tN7oHJbc2Enih
	Qm7HxSl+1nSoB0Ld3w/pnD/fJHSqJr2aRlY6RAmBzwRCeVutAhuckNyK
X-Gm-Gg: AYBFou1+8e/0YsTmlG/qmx51Ud4ZdZUjcYzQtVq9WrUA/58qGn7U7tTWfBy8Dbkxtj+
	5lHxsuPPojOK8Y6ccGoSXAkId9o6HzAOSLdgAbFPodPR1eLTI+B94rtKLGQrE/DGOfwj8J689Hq
	V39Qi735K1JqcwfJtFO/j0TI3CZh203AtRsGutVeNkO32gdYDuMAkklFynf+r43ND/LMnkr7255
	KsZA9ueWZ9iVkw82Z6l9MttCvDAfQnEjlNBpscZbGRq67GAHl6npVMf1H7vVRaWUNEDRi5YIZyg
	eGNkLJWa69S4LPliQBOBUwCuhPCKCLcuLngE/N9lDTPqoNKOHDIzdojQKxN/MWYm6/lv8Y46NzC
	WqsqY5omsqxux0ImRbeDSpVtiWf+oh1JfeA09YhBeHzwVOSAgKe+zZVbtOR4iMwJt+OXln3/lgG
	2SrO27+bCfvrQXQtXOQCz62PU2aXrtuZr9AHAc3G2v9tdYuTAof7VlIR4v7XUoEbX17vCxo1hMh
	3Xcy2PWRessLcr42CVFXyDh7mELkfOJqbp65eXJX3OpMIsW6yuD5aOWkbr82ROsTzJGxoDsTVjT
	sIAKqmgb+Aokzgp3+4/EPrhxc6TWgYj71kZCXTa8gcZ8EZAYWmx4M2NzqvC0WVKvQbdfy/UPmbu
	bN84YYrOcZ7Z1TsS3Ca34IE2mpjSjt0w/nejqCHnKH7ShqiVGg5NM0o3lT1t9l3PPbtwUtMe0RO
	f+VzU+EcTh3jqnLSxRs59g3SQ=
X-Received: by 2002:a05:600c:6094:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4ba023456famr12261025e9.13.1794270092555;
        Mon, 09 Nov 2026 16:21:32 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:31 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 1/2] wifi: ath12k: report size 0 for unsupported target memory types
Date: Tue, 10 Nov 2026 01:21:20 +0100
Message-ID: <20261110002121.90167-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
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

For a target memory segment of an unsupported type,
ath12k_qmi_alloc_target_mem_chunk() warns, clears the DMA address in
chunk->paddr and keeps the requested size. The response then carries
address 0 with a non-zero size for that segment.

QCN9274 firmware WLAN.WBE.1.6-01243 requests such a segment at every
boot: type 0xa (QMI_WLFW_AFC_MEM_V01), 8 KiB for an Automated Frequency
Coordination response, which ath12k does not support:

  ath12k_wifi7_pci 0000:06:00.0: memory type 10 not supported

The firmware treats a non-zero size as a provided region and maps the
given address. Nothing visible follows with this firmware: memory ready,
firmware ready and all radios come up with or without this change. The
response is still wrong, since it claims a region the host did not
provide.

Clear the size as well, so that an unsupported type is answered with
address 0 and size 0, which the firmware treats as not provided. The
warning is unchanged.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: size cleared in the default case, no AFC case; warning kept;
    message reworded (Rameshkumar Sundaram)
v2: no allocation, size 0 (Rameshkumar Sundaram)

 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..4aaee5870ae9 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2792,6 +2792,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 				    chunk->type);
 			chunk->paddr = 0;
 			chunk->v.addr = NULL;
+			chunk->size = 0;
 			break;
 		}
 	}
-- 
2.56.0

