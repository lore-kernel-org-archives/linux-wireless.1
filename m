Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964083;
	b=0/KlNBhOEogolWgQ6O+LtLuJmT3TkVXtymZIOLqIAwz5+ac5GHb+xLl7vP4xHPRrb9tF
	 9jn4r3npEgXJMa57iq5/bMquhzznjgJ+Wo93dabIuWGCs0jFSAmgh8i58BlpDoIqospVH
	 hJzbVaLAPZcJQmFIvEGnw9bGmXB82Rl80wAJz9/zT66o8QB9j3Kxf+V3vqrYnHqYToMBA
	 a6VV6y6XOyqMvZ82sflwEtEbcwnNVLm7o35R0qezQQiQu/4yf3UNQW0agbFtLjHXkI1zB
	 rfzGe2rrNO0up2WJgEGkA0MpS8vF8/NrzXmnl43DSv+pI5Hx/ezbjF5d8YUzWGlMT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HQdT+qMM2pGLnn2yPls2fbi8qR4ajUg5XLEX2psNOZ4=;
	b=3Ya2WMvRp0B2+hxdeHQJxb7i+sTCAHLBABl/GIvUajQ+lopg6di8KCD2s1erzzxfcllz
	 jG4svFQcizxjSZEeyIFrAchldpSkk1dQpv9RrrIoxrU4vFFVFbh7sW3EONQ1sN7Z4VvW+
	 mpLVD/RaOHkBgAeB/vwUpiVj+JQxrp4GsYgQjj2Jd6aOuBS1hG4ARe7xmzpLBtvAkU77a
	 QbM/2Gp23zm4OybnT3V7CUnGvI9kUDxJVYOcXStY9VhH/66SAgsGS8h3+Ch5obnMP1KNV
	 1MvU1eyJ8h+YGq5OeaL62IKShWY5c8lg1WchR/vk7FuV7/xHXh33ET4YZNxk/OQ2RGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CXV9T8AA;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA4606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CXV9T8AA
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso313525a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794964082; x=1795568882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQdT+qMM2pGLnn2yPls2fbi8qR4ajUg5XLEX2psNOZ4=;
        b=CXV9T8AA6CamDCx5LLCU+7+ARAZ0l9BxfyNyxdoRGaxJX1um5XQQZ5dHNNBeeK2e8J
         e48anA0sHD36XIWdsts17UskXB7VsbqXd5T6zOWQiIQbEohK5IKFVWoBZD/D90yY8B3F
         2om1E87ZioqDmRT/VGMFHWsVU0YzmwGhiQ/aQeLLVOKZhEJLSji1ZR7mUobxpiYuFN6x
         CSx/9O0Ddjzc1Yr6+CSUlaHaKNvqAYkcSYYs8UiC0p7FXr2bjuQmn58/X0rp1OirjmT/
         jdzngC+ddjnZExvTBeoaYXKh/1s/Gpqrll4Z8WJe+wYTRStx0K1PDm3HCv3hCPzyXCSd
         Phsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964082; x=1795568882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HQdT+qMM2pGLnn2yPls2fbi8qR4ajUg5XLEX2psNOZ4=;
        b=TIUX/9MBl+rkhSjUo4FG3GQHCU1jIpO7ef3GffpGpn1ACP/vI9r7ljLbee/yS1KO5G
         zWhQzVIF/Ewl+5Nk0ta5DmyilZ0vwo8aw7p5P9wW739vNBhbDVwM5l1UDpMcSsio+zBJ
         FOxO6RuOtXFQevPJZcErG5ucsoZlNQ96J6eNIX0WhowkFL8Y6Ueue1elrGMVEmfMKOQm
         G+e01z4UAlmj/eCD2lQqyACOJM+BB/wG2NCc0HCSNsNF+EbmQ2HinmHqpuhqSkmUUSTN
         bR928Ix8NWGDHFSjMs11bMzTQJpj96HR2Kwi9hPXEBdnejGlhMmhSpbM2v5nIk2uIbr3
         +m+g==
X-Gm-Message-State: APuU4Z+uLx/yo7KMvPAzWm4dnGGEH1b/EK8ZHTAfakwGcmsWr+HAQ2vT
	f8chSc2zcpM2oJy25u7FARRyr/piWFW6osZ3RQ1Nx89BRIJSi7LLfBp5QLqF5Rup1TA=
X-Gm-Gg: AZFdTZcDn1LIXWD/c7JC4B51pyL/m9RFZJvsMtzGNcU54Y9jGR50RzQsh3RDdms2coB
	+38owY/VppyIGfdnEW+6RUb4RbD640VwY3FMGC2d2l9PCQqMe5FnA5URD0Lg0ylCrLzJoWgHg4Z
	R/bGTuLIAd+REhJ2N+yUWxKsLhVACtrH+H5+PrSIuH1awAYTz8PYeucH6M/LXVEw/d0z3Ihbz5V
	9zDfe7WrZ9tFtTcDBAAW8Rvazg9WLTfGNneIuwsjac3nYDwLjsYdDkFrwK6shBnAN4bmXVepe/m
	j7tXZrhBv/PAQjdUCvdgRadTAxdz+xaAI5XRWe9AfIkc6DKk2uZPKY1S5ykQUS5OZWQyhF7W5YH
	L0nXXOVf4YobAFdJGncOXkuVif9bg8dauKl1943CcoZde6AQ2GhNtwf4pKDQ4KiCYibXJhtrXdu
	+HKSiurZbegJXWtUsHf1uswMxLGB03f5+MnxSGxyXGqIrYIiggbDXFzeBxEC0JNi/fiV8aL53V2
	MhPe+HOfMSaz0gh2goFfImDW3NMGNFCONrAAvrW7rRbxluFBkOCJhZKhSEVCTKaVzdb9dwdz3ZJ
	ylpEHbU5G9GJ95pbXSix47Ko2SmEqCSwpcwLchePIZmyxHHHBN+hDg4Vu5AMX4+5NFLptpn1IG7
	IqrsqoCi6AjuR+QVgZwciWTEXnwH9wvQ4pg==
X-Received: by 2002:a17:90b:1809:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3b3d07ab0f8mr1095083a91.36.1794964081858;
        Tue, 17 Nov 2026 17:08:01 -0800 (PST)
Received: from mma-H9MHD44.lan (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6420780a91.10.2026.11.17.17.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:08:01 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	arien.judge@morsemicro.com,
	samuele.yang@morsemicro.com,
	james.haggerty@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH RESEND v2 3/4] iw: support setting an S1G monitor channel
Date: Wed, 18 Nov 2026 12:07:37 +1100
Message-ID: <20261118010738.1353183-4-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
References: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
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

Add support for setting the S1G monitor channel. For example, to
set an operating of 44, 1MHz primary of 43 with a 2MHz primary
we'd use:

iw dev mon0 set freq_khz 923500 8 924000 2mhz-primary

phy#1
        Interface mon0
                ifindex 5
                wdev 0x100000002
                addr 0c:bf:74:00:30:fd
                type monitor
                channel 43 (923.500 MHz), width: 8 MHz, center1: 924 MHz, pri_2mhz: 1
                txpower 30.00 dBm

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 iw.h   |  5 +++--
 util.c | 22 ++++++++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/iw.h b/iw.h
index 2155b8d20468..52a17c633b75 100644
--- a/iw.h
+++ b/iw.h
@@ -114,6 +114,7 @@ struct chandef {
 	unsigned int center_freq1_offset;
 	unsigned int center_freq2;
 	unsigned int punctured;
+	bool s1g_primary_2mhz;
 };
 
 #define ARRAY_SIZE(ar) (sizeof(ar)/sizeof(ar[0]))
@@ -223,8 +224,8 @@ int parse_keys(struct nl_msg *msg, char **argv[], int *argc);
 #define PARSE_FREQ_ARGS(pfx, sfx) \
 	pfx _PARSE_FREQ_ARGS_OPT1 sfx "\n" \
 	pfx _PARSE_FREQ_ARGS_OPT2 sfx
-#define _PARSE_FREQ_KHZ_ARGS_OPT1 "<freq in KHz> [1MHz|2MHz|4MHz|8MHz|16MHz]"
-#define _PARSE_FREQ_KHZ_ARGS_OPT2 "<control freq in KHz> [1|2|4|8|16] [<center1_freq> [<center2_freq>]]"
+#define _PARSE_FREQ_KHZ_ARGS_OPT1 "<freq in KHz> [1MHz|2MHz|4MHz|8MHz|16MHz] [2mhz-primary]"
+#define _PARSE_FREQ_KHZ_ARGS_OPT2 "<control freq in KHz> [1|2|4|8|16] [<center1_freq in KHz>] [2mhz-primary]"
 #define PARSE_FREQ_KHZ_ARGS(pfx, sfx) \
 	pfx _PARSE_FREQ_KHZ_ARGS_OPT1 sfx "\n" \
 	pfx _PARSE_FREQ_KHZ_ARGS_OPT2 sfx
diff --git a/util.c b/util.c
index 64bec12487e9..eccdbf3122a9 100644
--- a/util.c
+++ b/util.c
@@ -507,6 +507,11 @@ enum nl80211_chan_width str_to_bw(const char *str)
 		{ .name = "80+80", .val = NL80211_CHAN_WIDTH_80P80, },
 		{ .name = "160", .val = NL80211_CHAN_WIDTH_160, },
 		{ .name = "320", .val = NL80211_CHAN_WIDTH_320, },
+		{ .name = "1", .val = NL80211_CHAN_WIDTH_1, },
+		{ .name = "2", .val = NL80211_CHAN_WIDTH_2, },
+		{ .name = "4", .val = NL80211_CHAN_WIDTH_4, },
+		{ .name = "8", .val = NL80211_CHAN_WIDTH_8, },
+		{ .name = "16", .val = NL80211_CHAN_WIDTH_16, },
 	};
 	unsigned int i;
 
@@ -552,7 +557,11 @@ static int parse_freqs(struct chandef *chandef, int argc, char **argv,
 	case NL80211_CHAN_WIDTH_4:
 	case NL80211_CHAN_WIDTH_8:
 	case NL80211_CHAN_WIDTH_16:
-		/* can't happen yet */
+		if (!freq_in_khz) {
+			chandef->width = NL80211_CHAN_WIDTH_20_NOHT;
+			return 0;
+		}
+		need_cf1 = chandef->width != NL80211_CHAN_WIDTH_1;
 		break;
 	}
 
@@ -752,7 +761,7 @@ int parse_freqchan(struct chandef *chandef, bool chan, int argc, char **argv,
 
 	/* Set channel width's default value */
 	if (chandef->control_freq < 1000)
-		chandef->width = NL80211_CHAN_WIDTH_16;
+		chandef->width = NL80211_CHAN_WIDTH_1;
 	else
 		chandef->width = NL80211_CHAN_WIDTH_20_NOHT;
 
@@ -785,6 +794,12 @@ int parse_freqchan(struct chandef *chandef, bool chan, int argc, char **argv,
 		_parsed++;
 	}
 
+	if (freq_in_khz && argc > _parsed &&
+	    strcmp(argv[_parsed], "2mhz-primary") == 0) {
+		chandef->s1g_primary_2mhz = true;
+		_parsed++;
+	}
+
 	/*
 	 * Either this must consume all args, or users must pass a
 	 * valid pointer as 'parsed' and use it to know how many of
@@ -850,6 +865,9 @@ int put_chandef(struct nl_msg *msg, struct chandef *chandef)
 	if (chandef->punctured)
 		NLA_PUT_U32(msg, NL80211_ATTR_PUNCT_BITMAP, chandef->punctured);
 
+	if (chandef->s1g_primary_2mhz)
+		NLA_PUT_FLAG(msg, NL80211_ATTR_S1G_PRIMARY_2MHZ);
+
 	return 0;
 
  nla_put_failure:
-- 
2.43.0

