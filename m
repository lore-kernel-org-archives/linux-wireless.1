Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439080;
	b=Ba9UE/YSjlKIvm43HBHLmmkw/HrIpmFW4iKmk+m09rzAjDsYY9nGmwhQY6rM3flW5WJ2
	 feZm6/IVwqc3G97PQvVmvtBqoG3hvWsukzk3sF2yol15J8pK5hx59d/ohxiWPoXLDmJIP
	 eY4qTYWKEzqeVxbAaIyBS4RIIl2L1/lMausIAmakEDmUOpDSVx+8rLg51YZgVFY27sp1T
	 BVY6fRDRdJwx4xcnjI1NIr+nfoHzXQARdC6hWta9LmFSmTMV9vNtl4bM/qRqhYybBPjRg
	 y+P+U+BXDCdLuYqLMI5M4EXKbSJnj8xmBT9BoQq8kIF39a3b6GoSiofuBvkZxXA9D9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hJIlttWx83H/gH+IsCx67p64peRkehwpXoU8dYayss0=;
	b=Qap/+duYOZesEjWVwI5ieNxHHP9loIt6iZ0Ec1ER6g4Fs9+YcHhIGxBlOoxLrD58KZBI
	 OShxnqlDCYG24dhiKKMd9SeOY+wdJknX6XS8U42p9Fwnld37fFUCwotWohOtv5wnvbRgg
	 VSuYkJBpqkax7KsjyIJujguRPH0l9pbKv58oG/KrSs6ovcEiZ7jCZBN+kzrKS+O+UIDZ2
	 exmrdbwUiCEAeFN/HGkGpVjigpz4wlS46mvygXcSPGJOl4TdOtqXMr0undZEiDfAPRJLk
	 yT8iJeLyk6Lsnr7yDwr8HD03qsPp5K2YoOCX6iNM7LOpSce70E7aaVpK0g65hUOS4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YI86hYX0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77507606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77507606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YI86hYX0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so9780503eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 05:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439078; x=1796043878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJIlttWx83H/gH+IsCx67p64peRkehwpXoU8dYayss0=;
        b=YI86hYX0JrIzb9tJVaXByzsMwnjIJFc+ssFurL6mYsha5tUcwst2aa2iQqHJf+7VLm
         DvAxfmLkTBroPGTIZjX7hWBpLwXvX8L57NApSea8k88FhY2M4cVLtbWOpTB1zdx2t+00
         0Y8Z6gocOFPa8DuFJFDe5LAbJQ60ja6efEd7UG2CQt3fEBfoqeIoY9inchBEFW4x3Jaa
         sBU+ezs2mpnGpdkncSR0IGEAUiG7iiggQYKJ+gFOsd5O04zx1/ULVut7npnYUNZnQs8p
         V3HA5s2YNdeWh09YjaZF6tnA027ApwfLxeBvlylB4/cnBvlk92cOXVkNH4sscW7OEtjK
         auXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439078; x=1796043878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJIlttWx83H/gH+IsCx67p64peRkehwpXoU8dYayss0=;
        b=Y8nTFdCkNMkuO2n2GBY+m8RGlV0XoXBWV3SrFdNWrKiC7YzjW2aSNPRAR6hLK+3zed
         oT1JJcstNgSLhu6BrnEENniVi7eTn2rp5b+OPG99zsFB8ILL/LRd2vf1xYL5e2lcofHX
         oBJ6Qexj9kmEauw/PhcICCPMtD6MP2jDGxUTGruVSzERvTrgML946MgO2yoDYfio5FoP
         MTBArhRYe5nYTZhnULCK6QJFMMrsZXP42tnQ9W7Nv6/BKKMuuURd3pioIOCOu2x3jQAV
         OtIfhJoyW/zqOej9XnVasxE7vI6kBAsK5i0Q9MQ0zC8lznmHtof+dDg24LaaxGgTTmB6
         TkwA==
X-Forwarded-Encrypted: i=1; AL+hErHq7mHornFfKNqNgPhV/Gzdes6uB4fgSP2QajIiSE6/8m7Hq4nVS/66EeyrK7DcOXKgxPZOIuhaHKqVW3O2bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9BkflFF7lkaEaVgq683wkkmUS01jaliTaQsAAmwldu6snuq+e
	j+6SWxnmCmi4EwM7ESer2SR3+LJcq33G7H7tiUuC96W7+L16B14eSolnHZ7rTQ==
X-Gm-Gg: AZFdTZdwZdwwWUs9TIauUaoMUDsxxLuyavzKG/4vk477yJqaXr6o/UYhFTpI/Sj+iHS
	D30Hc1EmMmY720LATc9d3B2cKdSO+MGu1tRuiD1iA1RCGZ6sbo6eFHwCi88ggB892KBrDLLoP4N
	4df76+BggeRk7/ZFRBJDrDVpFeVG3VZQSkwTpOTDsbfU04A6eV3XwjhawctflUbsReEFzNNuwQI
	7cSjCAvqUIgf6czEklE0ZeG7E0U995G2qjbdtfQcDlzrSyc/wVQAV49MUO7JPtwSXwFpbUlNg2K
	XDwiv7IlMwr8goxm8YnkYnZp16PlxFAI4rKGEKCYYhaiMPrF0wFfC6VL4ImJhI2iJZl/Pms/pQ/
	ci6xmak/zexnkMVVZsVn2hIQUXoTMtkJsX4xsHOQ8J0esCHzKlhEfVMPl6oC4g5qCkiKUAGnmsL
	CZgKj+ik51EacYuPlAI4GJcT28gmc888jHoq0av/tW7d+mpxQ9dEbLKMeo8MM9t86RUbwZl9sss
	AEjE+pDfvt88SLhAm14PAwR5V9rVw5yINS65m0ti9q2Zt7xpxiwnWNi3Uy28OhhEVn3tim/u9Np
	o497GINcjlfco/Ljb8TklK0dFNimLltbEBGpaU2ubeTyVcFPgE/cXw==
X-Received: by 2002:a05:701b:450b:10b0:1b2:4e2e:d95a with SMTP id a92af1059eb24-1b55e06c4d7mr9933460c88.2.1795439078312;
        Mon, 23 Nov 2026 05:04:38 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm40262666c88.14.2026.11.23.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:04:37 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: mwifiex: bound the RX reorder index by the window size
Date: Mon, 23 Nov 2026 21:04:34 +0800
Message-Id: <20261123130434.2841777-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mwifiex_11n_rx_reorder_pkt() reads and writes
tbl->rx_reorder_ptr[pkt_index] without checking pkt_index against
win_size. seq_num is a 16-bit field of the RX descriptor from the
device. If the window wraps past 4095, a seq_num above 4095 can pass
the window checks and give an index far past the array. With a one-slot
window, which a firmware BT coexistence event can set, every accepted
seq_num other than start_win indexes past the slot. A single lost or
reordered frame gives such a seq_num.

Drop a frame whose index is past the array, as for an occupied slot.

Found with a CodeQL-based static analysis tool that we are developing.
Both cases reproduce in a userspace harness under AddressSanitizer,
which reports nothing with this patch. Not tested on hardware.
Compile-tested with W=1 on next-20261116.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Fixes: d219b7eb3792 ("mwifiex: handle BT coex event to adjust Rx BA window size")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

nxpwifi has the same code. A patch that adds the same check there is
marked accepted in patchwork.
https://lore.kernel.org/linux-wireless/20261119095214.186808-1-guohongyu@cmss.chinamobile.com/

 drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
index 06b005525078411..54fb52be963aadd 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -616,6 +616,11 @@ int mwifiex_11n_rx_reorder_pkt(struct mwifiex_private *priv,
 		else
 			pkt_index = (seq_num+MAX_TID_VALUE) - start_win;
 
+		if (pkt_index >= win_size) {
+			ret = -1;
+			goto done;
+		}
+
 		if (tbl->rx_reorder_ptr[pkt_index]) {
 			ret = -1;
 			goto done;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

