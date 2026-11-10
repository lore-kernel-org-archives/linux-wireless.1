Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270095;
	b=goJxcWRXU7W3Ru3LWQ+Q6BJTUSX8sadXVSmSvTJ2ByXrWFXUK0fALEzRUhpKjOmZiG+D
	 2FqDYSM/dypYWtSMoKxt4YLGUZxKrtoxrP55gmtbLpzJtFf9FkIfeOM963tjDHk9VMugh
	 74eT5k1MEoGMJC5ofxgvnNLVjgutkoe4qpV+MRu6eZ154yFlFtEf0/rSBFG5JvMuu8b/+
	 UU+mDU7xM1Md9OCEJ56PvMVhsbXXNW/mtRCko7bp2ks0jyiahTe8CRJJ39PCGwC6NlVry
	 1wcLUBHTDfgTYcC64MPweq/G8Yn1m3pP1fIRu4LEZt7qgcl3FpVCzKjp2V4ksH1EriA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
	b=SpB0BqPrs+A+HCOk+bdtTgJdWeLsEb77n8P6nDPyFATPKMp0muTLIWXF/d8ZhsFgNe5g
	 OKdlkYin6yYt8OTpS4iRPBMv/f+lnK5XkjivMIANhM5eaK2agmpi8AyfnlPVeuvRvOb/C
	 3v/bsoJpRre6Isxx8nPAyWFsYzbT8KWh8RjfvWcUjTOldUvtkGNX8oF4US4NdNxttUrub
	 2rX4v5HaYXr1FxA8mCFbnuk1teOu5/G+/EHlfKCN5LX9BIogMumWzE/apPkLtnMU1rwSa
	 fI1KJQnllX+vPjCAB8L2Bzra5QsdUSo9ZTLlSgxrXFvpdtnK10vzA6ckR43RNUU/RqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ik9GbU/o";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6060A2607
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE6060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik9GbU/o
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11121395e9.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 16:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270093; x=1794874893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=Ik9GbU/ocJuTfNtmWcfJunKlWBGx/v7FS/ld4VaxP4HVzoLiQdH+b59l3GXys3RFwW
         BklJ4IqjizWUEFJuhYlcRY2bKaZTOKVRZ0uJwsz19z+zxfSoIB5/VFKqrF8KzMPW4YQC
         BMV2bvm/3j0kcj2SsNHxEE2DzTm/1oiINUy/yqNRjWj2OFrbIRE8qRn+RdkuJzT8fbWm
         pUj78BbdAe1b5/hIB8eRKPKWiAwxy2Z+y6sGGdvXuBVLZpToyLkRVP7mCAhTsJP3dHEG
         xSwJmIaWrxx1/XSW9U0kFF4qpPuPbrsEJdmDG6NNh+fmxwA74fZfFqMbhvLpoSOGIKLV
         kDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=WphcunkxnQF7iMCNYbRVtgOyJIzl5EAU0Vq5CqetpoOPO52D0OFcsTI0oKwB+l8dD8
         fhSnawejsta8TQyTtv/wu0qCiv03zHCZ/8FYxLlPi+kMPW4WdCjiY7Fd2MRMIm9gLM+b
         XZKoq+vmf5r9Y3KWU32Ew5QM1x+NfNLKwjWgIsEC4SRmxmCn+t2T69Atg6QlVMJn5NgF
         M+i/9WW6zjwHTIdsOycZuFMzegZmTf+0WCxdju31pPAne/uk4CuK2zOxra6/cKix5UR/
         5Xe1BY9JQQ8/xf4ppHnjGROrgAuhVRugaFGEoB5yVoHvXLmmYbUj1Dm9dGuF7Iyh0edZ
         z+5g==
X-Gm-Message-State: APuU4Z+Fq1qn9BktEazRtqIH5VBPG7zf53HS8WUMgDx+7LX0wrYfGprT
	ctHOOqsTcKqVS6HVtLy6wwXOKbOI0RaYna6ruzgBPsPFaS1TH+U9iBvncew6PQTWj4k=
X-Gm-Gg: AYBFou1GGZmnoLwBaMFRkMKgvCHpgYTolOi5dQt0btzRVfvHgCujqXOSgwRgMZ437Tv
	VJaH3w68egsA3sLXj/gKVS6Ln99pXM57NKnM7gR85eKIY8bSni4QuvzMMoPjwAPp40m0NG1aIRO
	CU3CC8UA3rOSHwHpi6Ttao1H4QehCBY7M0OMgCGAZn9ew8tcqCCtLSLhjofTfpkzkvpCccECmcA
	vC3uQg3UhhbIkr/6d9zQuvDON5XrCLccunQaEkYEIpmZxXXs0d0YfduHbRXPNnoOU7Czs19xKrx
	HdrtonOS+nGK1YtIRgWhX8UtH83qbJoblXnG41ZLjJJGhjCGKUDzZxJtaT+v1K1HLMjtoK4Fj3L
	Y3TaC+n6GwwORHXHB/a5NlvzvK+h0ltikuRWQ1DNpQdeZ5QUFSQGhGkOpgEN1MMLhWPBKgfNegO
	YalgLm1I6Dsx8q1RkhRXs9VakdyzuBsAxrhtWNpwSAYSG3EMmNv+s26IcdBW+nIPpFIG5jAKg7p
	0pfNAmu8IkXFl0ulFqXJwgiLg3Kk/3j15MGoyWG4AzA7v3e953rKEsOC1uIPfGy7FCIxKliwuFt
	fhJDwKExViBoCaOV6Wa+JVHZ+B0Ib01Vsa3VR7lI4X8KtiXk7sfyWSjGT/keL9og9l3Gf1vK3cc
	ATMcZx0Dmu7KlM1XWiDlJZf7teU3e4kQGiOgNrr5gjeFeU3G3mMrdKs4M31lkR0CjSz1PNldjZZ
	7n1cSH9vVu7yVrHUJRTdnIBGk=
X-Received: by 2002:a05:600c:1d8c:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba02358712mr12177855e9.32.1794270093423;
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Tue, 10 Nov 2026 01:21:21 +0100
Message-ID: <20261110002121.90167-3-gsustek@gmail.com>
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

QCN9274 firmware WLAN.WBE.1.6-01243 advertises direct buffer rings for
module IDs 2 (CV upload) and 3 (Wi-Fi radar). ath12k_wmi_dma_ring_caps()
treats any ID at or above WMI_DIRECT_BUF_MAX as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
service ready ext event; initialisation continues only because the
service ready ext2 event completes it.

An unknown ID is not an error: the firmware uses a ring only after the
host configures it, and the host does that only for a feature it
implements. Skip such entries with a warning, as for an unsupported
memory type in ath12k_qmi_alloc_target_mem_chunk(). Store the accepted
entries contiguously and set num_db_cap to the stored count, so that a
skipped entry cannot read as a zero-sized spectral ring.

Based on Nazar Mokrynskyi's version, with the separate count that Jeff
Johnson suggested in its review.

Link: https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: warning instead of a debug message for a skipped entry
v2: commit message and comment reworded

 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..9720bed21631 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4988,8 +4988,8 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	struct ath12k_wmi_dma_ring_caps_parse *dma_caps_parse = data;
 	struct ath12k_wmi_dma_ring_caps_params *dma_caps;
 	struct ath12k_dbring_cap *dir_buff_caps;
+	u32 i, n = 0, module_id;
 	int ret;
-	u32 i;
 
 	dma_caps_parse->n_dma_ring_caps = 0;
 	dma_caps = (struct ath12k_wmi_dma_ring_caps_params *)ptr;
@@ -5015,26 +5015,39 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+		module_id = le32_to_cpu(dma_caps[i].module_id);
+
+		/* Firmware may advertise rings for modules this driver
+		 * does not implement. It uses a ring only after the host
+		 * configures it, so skipping the entry is safe. Warn, as
+		 * for an unsupported memory type, so the gap is visible.
+		 */
+		if (module_id >= WMI_DIRECT_BUF_MAX) {
+			ath12k_warn(ab, "dma ring caps for module id %u not supported, skipping\n",
+				    module_id);
+			continue;
 		}
 
-		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
-		dir_buff_caps[i].pdev_id =
+		dir_buff_caps[n].id = module_id;
+		dir_buff_caps[n].pdev_id =
 			DP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));
-		dir_buff_caps[i].min_elem = le32_to_cpu(dma_caps[i].min_elem);
-		dir_buff_caps[i].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
-		dir_buff_caps[i].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		dir_buff_caps[n].min_elem = le32_to_cpu(dma_caps[i].min_elem);
+		dir_buff_caps[n].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
+		dir_buff_caps[n].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		n++;
 	}
 
-	return 0;
+	if (!n) {
+		ath12k_wmi_free_dbring_caps(ab);
+		return 0;
+	}
 
-free_dir_buff:
-	ath12k_wmi_free_dbring_caps(ab);
-	return ret;
+	/* count only the entries stored, so no zeroed entry looks like
+	 * a spectral ring
+	 */
+	ab->num_db_cap = n;
+
+	return 0;
 }
 
 static void
-- 
2.56.0

