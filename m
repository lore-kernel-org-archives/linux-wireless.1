Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875609;
	b=qMUHxL7eclwzswdpIwV7FJHeKyHtUiRcwLboyYneYntMJqy1g8RLkQ7ZgLvNOxlXNAIK
	 hqforaKe8pUrfkc8ougfCr4jvgxGKw13B9KlYJ+RAk6o6t8GBjOLAakWSjqZByY/HZruX
	 kSkIitSWmaa4qol42QbgMbRUZNUqAvvESzq/Uqm+wlg8JdthYesAqR76NMy4A8tLHTDCG
	 yQYOcBi0IYBFSs2MdHD3eQGnCF+t2n53jI6hdTNS3bDe1r1beXdBUgkTYmiran+Wa49wm
	 GcedgvZg23fD1CBKWBTiMskrc/Gl6BNV6CXEACSndMusPQeNmP23G7W9dx3xcAHPnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
	b=GIZphjuTWp1TbrmZdPHbYCdmnm6eW6xfDk52CBWxoSowWtMJ3deP12lxnktkTPHfG1E8
	 60vU4qOYS12q51P6C025dRDnjp4Uf6KlKfR71VqL3vNR9r3IUpsX6BbJTvnSzH/8jlb07
	 1GB3p6Gy7k82HY7KJORJXpKlKXd88ddC7Ovsw1qUQlcEW8yZopZwKfbe7tEWTySX1sa1O
	 LGnEfXE3tvPhO49DB2vX+2hvRn6lEfh99tpZ+5glPPmFAbNxcyaO6pj7N/KH7OxgrZhDZ
	 qclo15HaXRfoYNdGx2pACONcqlVfTu96y1HkIlv/TCn7utQyP3QFfaS5AB/OKk6AVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B3lxySgF;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ED2606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 00:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71ED2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B3lxySgF
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1350791a91.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 16:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794875608; x=1795480408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
        b=B3lxySgFgBocZCIkKLBsDw3eTtbbmhUnUfQtCY69FiB8e/rVwQTW5Wz2WfXf+4Lpfq
         jVWAyZSmN6Z+QaFejjjF1IAn4Nkw838FvqiPSeaOZ95tVUi08BNGVVOM2/ynlhlAC5fB
         98BbVuM7k/WKcTixsPNY35L1lIcmNxONkTnQHqpNunpfS5ZaguXmr8VYYaBoJiurGUiQ
         389uv2gfXPImMNgFI/qEBAQzgBILA7QB0dTuStMixsJnzXj5FPSIqV1JTDYW1vQA/i51
         RkO0XVlYobvBkmW2QDysIn5/N5mehQhpRYEnWwM1uO7gfuGbbfP+pap1WxsbWT5QD0AV
         deaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875608; x=1795480408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JljOJ+5JZ/mVB7HR9h7Mk/LiTfMJkqAy9rLcaKV+yM8=;
        b=nvmDt1u+7XEeXmxreSekqGAMh/w4ZYWGMCr1x7BnbJda6ecvmFNcmZCsB9NjRQS5LS
         JbNkix9cGciqURSueqPfcx6zPL8KcY8zJBL62NALhBPbcP+T0cOvwRVdvL8jOpPd++Nv
         7Z/9hkmqTMcBmQcMQ9HUjOhb/7Tc7W/6cS8kk8r0mWVLl0Z3Z4xpwsut+lzUfYi6SGjn
         421NwGb28mdxOa6mDGzvRRolIkRKJ2FKtQJx0msr2IR4p/DeVlvH7FoH/XUfLDlvds6Z
         u0Mck/ylClGJHnkE8pR82mEQM5IOlRuUNZ9ZMH4T5gB3meOv/KEiF8T66HPJCcGPLg8I
         f2fg==
X-Forwarded-Encrypted: i=1; AL+hErEOEE1ibWghoQh2RuNdIWwbzbdZYdi30/89NXPxbeeP+2+D+y1K6Z9rqb8PPqUdXJ572GZkotDSRSxR6q/fVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jgN1piiybPJdNOF3WWUIA1aI5TnZjZjfG6w/qQ0v1moU+k43h
	XuTJxF83RYmf24Fy8U802kw5F+yvGTUpoYRJM9tdmdAl1Dz9GSLolgJtvFomyK/NLaM=
X-Gm-Gg: AZFdTZdLsWR8LJznZr4+TD+FTWEtUku8uUb7APoURcKIfZGrNhU9WweXGMbS1sGX0qN
	D0gOJVFxYtiQHLnN47BglASeNlRA52ZlkU59VP6Q3fblN7wrJ3tOjMK0dbmFEXH7oLxguFAiEUr
	Kx/y9+aqd0rUmJ01eOwQuJmsEDq7yumzSnH8sF0A9nDyttuz23DLzfb7UmWtbiOpMBYwZwukdV1
	EGjfjAZPNaXPWXP9PTynZ1R+b1zHJ4arqLIxOw2iJN/GJ55WirwXI4s6n1ax6xiDwawfccku0wg
	2ClDG/RfhKNZHDqTP9i0J1kLfh0NDiDapn8pLBhpGBK24Cg3ZQNZQP+PeoRfdAjoVbBGv5Kyg7V
	OxWV+yB8O/LxApdSNaEj+JNzolcJOYRU+yNzangjAJ5FjhOJyMbhHLongqGoeiQkEQ0byu9BZsx
	5nDsG7jAOjWcFELGTrgAZqUpU+1Onz/kFhbSy5NIt1Fh3h/lKlIvADizVyK+BgUEiQdaiMdJvKF
	QaSqLGeaxlCcEPJulejyg6MEJ10Zid6x+GN0Xxpzn5kC1sO2Oi3tikMV7f9Rdo5Z5ddvC00v6Sm
	oh0qQgpf3K84/v7/ZlauJgv/VUm1FSLKzvl1ZmqR37jXR+acW8Sni3A7GqroOrIrA4piRqfQCdc
	NTBnsiLSQ4Sb4rsM9/1ZnjhkJYcJXLL2PgEBiiwP9XtI0YcU=
X-Received: by 2002:a17:90b:3ec4:b0:3b0:bc3c:3e7 with SMTP id 98e67ed59e1d1-3b1b0a1bdc3mr12452321a91.10.1794875608347;
        Mon, 16 Nov 2026 16:33:28 -0800 (PST)
Received: from mma-H9MHD44.sydney.mm.lcl (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm1214868a91.15.2026.11.16.16.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:33:27 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com
Cc: arien.judge@morsemicro.com,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: mm81x: drop probe requests received off channel
Date: Tue, 17 Nov 2026 11:33:10 +1100
Message-ID: <20261117003310.1032097-5-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
References: <20261117003310.1032097-1-lachlan.hodges@morsemicro.com>
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

The mm81x receiver picks up probe requests on channels adjacent to
the tuned 1MHz control channel. These probe requests travel up
the stack as they are assumed to be received on the control channel
which leads to multiple probe responses being sent out on the control
channel flooding airtime. This is especially noticable in mutli-sta
scenarios at lower bandwidths where airtime is especially precious
and leads to failed associations.

To fix, drop any probe requests that weren't received on our tuned
control channel.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 drivers/net/wireless/morsemicro/mm81x/mac.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/morsemicro/mm81x/mac.c b/drivers/net/wireless/morsemicro/mm81x/mac.c
index 86e7887c1772..60d849c51da7 100644
--- a/drivers/net/wireless/morsemicro/mm81x/mac.c
+++ b/drivers/net/wireless/morsemicro/mm81x/mac.c
@@ -2115,6 +2115,22 @@ static void mm81x_rx_h_update_sta(struct ieee80211_sta *sta,
 	}
 }
 
+/*
+ * The chip receives 1MHz PPDUs on any 1MHz channel within the operating
+ * channel. Probe requests sent outside the primary channel are from STAs
+ * that can't hear our response, so don't pass them up.
+ */
+static bool mm81x_rx_h_is_off_chan_probe_req(struct mm81x *mors,
+					     struct ieee80211_hdr *hdr,
+					     struct ieee80211_rx_status *rx_status)
+{
+	if (mors->monitor_en || !ieee80211_is_probe_req(hdr->frame_control))
+		return false;
+
+	return ieee80211_rx_status_to_khz(rx_status) !=
+	       ieee80211_channel_to_khz(mors->chandef.chan);
+}
+
 static struct ieee80211_vif *
 mm81x_rx_h_skb_get_vif(struct mm81x *mors, struct sk_buff *skb,
 		       struct mm81x_skb_rx_status *hdr_rx_status)
@@ -2152,6 +2168,11 @@ void mm81x_mac_rx_skb(struct mm81x *mors, struct sk_buff *skb,
 
 	mm81x_rx_h_fill_status(mors, hdr_rx_status, &rx_status, skb);
 
+	if (mm81x_rx_h_is_off_chan_probe_req(mors, hdr, &rx_status)) {
+		dev_kfree_skb_any(skb);
+		return;
+	}
+
 	guard(rcu)();
 	vif = mm81x_rx_h_skb_get_vif(mors, skb, hdr_rx_status);
 	if (vif) {
-- 
2.43.0

