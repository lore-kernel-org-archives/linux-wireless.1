Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557044;
	b=zBlBSz8RYR/ps5VcnJ7i5ip7HNp9fo52p+kVvLJB29vP3Y5jC6CunfoTz6yyEHJTPNK5
	 SfVQSHBsHECl/uZRIc/mveF7xX68G4ZRmyBKnor9rtNzB/mf2qJxTnRq7gCLufJd2INsa
	 /d0VsfFeuyoJ5U7JbmP0d+axVEJjhE592OtBMgUORg/iMkP4oSRRI+AIkvZh8s8zW4qCA
	 QCImn2187WYWynAv5HFS69K0/UlEeO4c2SWR+jSscF/YNH5TR6eIH1E4VWVllMwCqHK2l
	 /zNzu7reTs0uiAR67/kD9gDfwSpYwPOc8ZTBPGWinIf/94TCPCOdsYD0dA2BSwja6OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
	b=arIeeAmWE/OYUsY1gLzI1APlSBK51eE9krPCKGYTeYzxqztk/x1cP3hyw33gHZDkzMha
	 VEsUkvG/pZ1vXzvaMcqxMKyy5Q5kCiYI8sLNYUlvzgNYnYBb2yfdaPRRc8YX2eximPB4I
	 jQmhcTD0mzizmwIMgrG/Z9KMt+OJI4qJZuB5kYK8vX6sSiMkKb377ftP1m5w+hbz28D9/
	 5pCRYz4qfC3diEsmPUmqs/3vHpdI2lfTTr5c2/x2NVdCmXhKg8SjMj2QzKkDlo5IDXSKI
	 vWbhzofrV0rK6YTj++c40rwlU2/uXIKXwb3gIi2j97/u/BPrvK6AtLFzS5caDY66Szw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zq1cLANe;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F41606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zq1cLANe
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0a0d1a1e5so12696235ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557043; x=1796161843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=zq1cLANe3GlkJJEYhzFqJ3BjKcq61mfeuvarmNeCFUwVmyJj6aJA8kuPEkfB4wB2ax
         EAdIXnfGAHoMRa8eG0UiC8ceqCOthuDRJMISNTu2mZziHR64zxJHdkSQrh/X0zClr7W7
         dmHrhcCv25FXeKs1lGcupJSCwoB4/diIjT0vrYrpJ98dEdy/15sRwTOy6Kp4aOxOIvyv
         Ic7X0aUYy9t7gXlcGMGfSHaho1lx83ha+p2GvaBUbhAFXG6thT3cOSoEmBUvS0VEvjMx
         GET4C9uQpeJSoUUsmguXXmTWy4p8O+A626VrSRoNxQc06cUAPOBu+3NegT9FMkiaMcOK
         UwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557043; x=1796161843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s70JE8KJI38v26U5JxLEQIN5jyIKDs/r/Z45UhNDVmE=;
        b=jB4mEzeBE2omewy9xH5Lzwr2CqBnZ/o8whjfEXVhO4o4hTEkT2h6CTaeACUE/rG++n
         CFBtVCmoE/SKf/JvgNGwLGOkNg598bJRyyEyuTXKArzFd3hajbL819gjpQWNuF3AlwsQ
         COsE8aG+uTYu4abwwBgkdND19SA9gIzKsr+lqjoMM/3udfjkC35QW1x5mnT++DMq1OA4
         Zkx6uRXskJ+D64Ttjmj3IuetpAaEdliIDFY/lohAUAI5vi5eC7b7dPqXw5+FrAmMA+BR
         FGj9kDbkg3pzoqCR795fqwVGR1NRMKpe2AS1iGILr0mjXwAdj3A/hhDPjQCmh42K1MWz
         ST1w==
X-Gm-Message-State: APuU4Z+JcfGqMm39MAcH+G8rtMv0TbNMx9KsHuoHlbGwCbDij+/zuX99
	bnopJUL8qcdyx+iHNgjk7/PD1BOoTkN5j2lO/eieZkuDbPWNcOy3LHbfmh9oIw==
X-Gm-Gg: AZFdTZcWzz0yFUSYmERQetBQEguoPkYyfXNd8gRFiyyPJd1WfmdsZN5l3vLssJlL7aR
	0wvc1oOzr6CoVi8RHodc/5J25jM6GjHDE7H8tcrBa/wGo3LnJAHR8OLioNdR9pE5CLhuYFf6S6K
	RnAfHQC7ndht9q/Qnv8dT9lqfwZilQAAMdhRXaULerdXA0qeAWZMum7y5MlWrzS1ZrpSGdYbbvl
	sPU9ML1PQjOl1a4pUzcta0MdkPt0HHm9IkAN2RlUsGIzhO+Ka2ZG2DbpVyE6KqPvFC0DtMM6z+j
	HMt1svN/T3FKo/+PWlaUQ8IJDjGftXWxX6PfBGKvb0ILU7nZYpsFPW1+/1ym/NSrKxzIQzMaE5A
	Wjo7wLPrqk6LmVgW+IK1s8f7LA93Opzq2xzf2KN3bkKKIzF4moUuSF51whm0fhXKg9C4tY7eG2a
	9CaktO1rxEUcTUr/N/kXb243u4Wr8FriQsrO/rO2g5JEDS5nRCbkWaWMey7+ReAAw3p/0pv1ixH
	FvZBTtvM9/Qy4sphdjtPAzxjG09tsB0U2dFVV99nSEKneF+6Rc2KaTQnsAY2Alk4AousnEblX/Y
	k6yVUn3edIDHR3Cia0BZPSwKaRqcg03Wr8nPjI9RIsU+A+cNtylwWL7BjieqU8WviBs6wq0VKCs
	28od6ASiSxkTbigUzmHxvthnWc6WQ3pQfz/pvT4B6Ci27fmvY8Rly7q+1zLLrsNm/7stB0KsHTI
	lGVQ==
X-Received: by 2002:a17:902:c942:b0:2ed:4456:fb2a with SMTP id d9443c01a7336-2f03f1bfa64mr148507965ad.36.1795557043298;
        Tue, 24 Nov 2026 13:50:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:41 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:33 -0800
Message-ID: <20261124215040.1261999-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

brcms_c_attach_malloc() allocates struct brcms_c_info and then a number
of fixed-size structures that live exactly as long as it does, each with
its own kzalloc(GFP_ATOMIC), error code and kfree(). This series embeds
seven of them in their parent structures. That removes the allocations
and their OOM error paths and, for the per-band state, the open-coded
pointer arithmetic that carved two arrays out of one allocation.

Patch 1 embeds the per-band state arrays of brcms_c_info and
brcms_hardware. Patches 2-7 embed the module callback array, the MAC
statistics snapshot, the default BSS info, the protection settings, the
core state and the BSS configuration. Patch 6 also drops the
brcms_c_info::core pointer, which always pointed at the embedded core
state. Patch 7 moves the definition of struct brcms_bss_cfg, unchanged,
above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Changes in v2:
- Patch 6: remove the redundant core pointer and use corestate
  directly (Arend).
- Collect Arend's Acked-by on patches 1-7.
- Link to v1: https://lore.kernel.org/linux-wireless/20261111042554.232998-1-rosenp@gmail.com/

Each patch builds with W=1 (arm64, clang) and passes checkpatch.
Compile-tested only.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, resolve rebase conflicts, write patches 5-7, and draft the
commit messages and this cover letter.

Rosen Penev (7):
  wifi: brcmsmac: embed bandstate arrays instead of separate allocation
  wifi: brcmsmac: embed modulecb array instead of separate allocation
  wifi: brcmsmac: embed macstat_snapshot in brcms_core
  wifi: brcmsmac: embed default_bss in brcms_c_info
  wifi: brcmsmac: embed brcms_protection in brcms_c_info
  wifi: brcmsmac: embed brcms_core in brcms_c_info
  wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info

 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/channel.c     |  14 +-
 .../broadcom/brcm80211/brcmsmac/debug.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |   4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 229 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  83 ++++---
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 139 insertions(+), 217 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
--
2.56.1

