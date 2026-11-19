Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048143;
	b=EmB/DRRcFd31vSb8ZKdY4XLib7nIBdtyzciyR6n4pS5MJV4BFgEou/u5BjgpCqz6ISlt
	 XkunK+1icEGjQ3ecZE6hbJdgg91505xEjcOmsG4jOFuqPwmo5fte+CqAXY239z71WGRuf
	 aCy7DzUGq12kXuvbnRk1Aj2qrhWwYfaNkiqE2le/4719nc3RYVHa70DJ116W1Jg8RyuhF
	 AoqfYBNQlYPaUylZp/gTUEDHjRG1QLevyarn2W2NO5BeFMfM53W751sRpd7qczYEG2Yv5
	 ynbIXOos0c0J5GrBNmyQuKFA02l6Djbj1rKYMaSo6w4nMAhOisycJuil1a45Dto+kRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
	b=LNRR3TEqLrygZoOetj4f884T56PMHrb1+BBXFAx34Z/lzsPj9nCsBtFX4joTzUnOKdmF
	 fBifEaMeZupl+k/3y4f1Ln1UuQ9yn0ObG5SY97MJLBa/xc2r6LZGYpPg9irXbchabVzgl
	 F/nAiZss/bcnv1NtC7Z4AFLB1y7vBDK4M5skg6HOHgoAyDTn+dT5cVh8UVzHsIrDfPPXx
	 O0MoMtTmaz0BqlczmdGZqlV+RcxS7vpbnCOpdL57aQz77NMVKg/C/btEA/fEAJGBfQB3D
	 5rMIBB5KONg+YSqBRDYAbff2qWHhSkQIf080keRfGNeQ7ukYlFngTsFTRdGkH9uC4dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlNcw2xn;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052C606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 00:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2052C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XlNcw2xn
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e7fc8265aso16520536d6.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048142; x=1795652942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=XlNcw2xnk/10XWBzLzdXEK7gMeMIwJgcUvEof6sAs3/o0Dti94lREoWLuPJmVHFKBh
         thLgGEHsU0jWV9CsPdGD5tv4ohGiCWu3vfdNptKaDo+Odw2w3Z4Ar5hbc3rgWGfazpby
         8FWPwOD09yursNaClJ3mEKsGwe6iORWfhSdpJS5K1mIBtqt1SYKRYBT6MtsvEYleatld
         SV7pM4BFIsoEsoJQ/HUDMMvYLWQNV+seVFtllDYgmMIAAa5JwhswoFnoaw+2RaIYhSZB
         eE/O/hw2eVNBDjhSQX5q2HpbX37SR/l2ZH5+/UMw/3igKAH3I6DbAdfjbxwEOoRvqMM+
         TS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048142; x=1795652942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NneEHT9afGNlYm0ZfBjltKXbYGbaj4NHU2mtTyQ52S8=;
        b=Iex29ISFU7tjWxmwkrCu6eqmbmIXMP0KmrZlyEPHU+EQDZ2z6XAFcEoYxSFDSi5Kj7
         yYqf4bsPqHTbd2J6aqAj2J1nG4agiZoBlYpLCZVfSu8vRRBHCbKYkXT+b2kxwWlNLtbz
         uPuzze9pfrrMewNEEd8rBc1aZMkIzumPDevk8R5E9e6LcSyi37GkQjZdiTGEXEHrcOXF
         KR/jMORByTqlmnkuUe67vWTxpHHKbiYVdOYrJlBbpAV050637ZajjDZ5MBB+fFO4mi/1
         wHNLVChgGLN+ZETvk0xKPtEIoQ7jgIesJf0ifNihI1TFMEEwxyw4OAsOPCqS6LTbS2mP
         4V4A==
X-Gm-Message-State: APuU4Z8k+fiPj9hmp8AUxCQiugK8yU57tgb37VDKGuVjKNnSDxCM2A3t
	0b4nPFsFrHBRtbur1MDm++aguEpsX+6C0eU/eufb7nHDUL83oPhK29Kl5G+FqcTD
X-Gm-Gg: AZFdTZeII58gDNexBbHBBSt0TexxcRgtp2/xGhfs0Vo1koh0uhFsYLHIhRA6D+LjCoe
	GpjjzYo5/LIEh184W2nr1YoNa4zBYf4cqm80A94mZw2GBtX4I5YnrzuXaIgwCSZ5iEuAgnnD7ba
	ik8GoPim6WiJjd6s7TL7Pp+UIBaj285+77jz5mPub9OY/w3nIjGv1lrCsOO5BdzeU4/VpW0SCY6
	XfXuMBLCivi4HdVWRs1MqhC/l6xSpXHP4Wx7d2PqLyeE8q+dMKbLjTztCY5eKAJpZIp/6CRIK0a
	yhZtpegehzRqjYNYrUh8CEuT0+zvekZrz0zNT9Vr44tTVr9khZ/Iwa4uwj9olQeoVjpwQtverR6
	VygKHiDgvbLWJT+io9FiCUuIxrZzEw8M8esv5RGsnxg+ESzqv/RZhVu3ibHGnznEwJGIlag8QyO
	7R9H5VxW7vk9GtdwQHrJb5XReAjKbAFendif3Mkh+sAF+sj+vwvYnVDLu7+3EusQ68WSUvnyACy
	TLbbVoCVJTSEjIKFTEn8ry8VTXgu/WtPDkQJkfURBqCFCp5NXHkUdB5m7FBm+ufqUBfHp8VZf1s
	h7i09K2QE8LkDQC77K3sQRdvddmvgEOGq9OHlE6Pfy2Xem+ZCu1L4ZU7bcUdZbjxAC8NBTW70PI
	mVPMk1K0tUOG69pKH1u4E
X-Received: by 2002:a05:6214:4306:b0:921:122b:80f0 with SMTP id 6a1803df08f44-92114f90a80mr69392036d6.46.1795048141981;
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:01 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 0/2] wifi: ath10k: fix leaks when HL TX fails
Date: Wed, 18 Nov 2026 19:28:56 -0500
Message-ID: <20261119002858.425666-1-lcy8047@gmail.com>
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

For SDIO and USB devices, ath10k_htt_tx_hl() leaks the msdu_id and an
skb reference when ath10k_htc_send_hl() fails. v2 splits them into one
patch per Fixes tag.

Found with a static analysis tool we are developing. Compile-tested
only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB and W=1.

---
Changes in v2:
- Split into two patches, one per Fixes tag
- Target ath-current instead of ath-next
- Link to v1: https://lore.kernel.org/all/20261118052116.3901761-1-lcy8047@gmail.com/

Changyul Lee (2):
  wifi: ath10k: free msdu_id when HL TX fails
  wifi: ath10k: drop extra skb reference when HL TX fails

 drivers/net/wireless/ath/ath10k/htt_tx.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

