Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345364;
	b=yhVqSs203h7Wj9Q0lFUfu3JAKWNjRSvsGJEBjGRHG50AMc8HfXyX57f118EXCvunj6ET
	 zsHIiO42qqYs1M+5fTW6C9RKIK826poScGNvkwqPH/GbzpnQ99Pus69gimNx5DS1w4xks
	 E5AYn+FG6IqP0h3pHb0syhC34avVTdkfI+Guc63XgSqPnf05xTm/BSZaJ24QMnVJ1cbYN
	 NqTx9Q6LYrK2d/WENLHiisTcxvxcYEDWtAbiS0vHIbP6DQenLdPw/QPfTQLe30Jkh4DtG
	 +39S0mE04wi2Y6Az+u6W6yI7etBGm/rD1o5sW7qGftg4Io+AnbHRQWFbcBhPlzxs6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345364;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=oe6lCbVz4PXw++hMRyTfF7hSGrlUjAPfQqINuBYzmDk=;
	b=QPeJvwhkUXRc8toE7pusvd3CgL2NGEPxM0fKBWRhFZF9nVsXkc6BBH5xFYV9N7jf3k4F
	 N+cZvHHZhPOx9ALVFMf6Or9kdcwfg0iX96CNLCWVwPO7GoXqXfkeRvvFLYUASkTcnHkO6
	 SYUIC9Ucq+B/F56l5AjzUT/8IrYoYiG8qNlcV4TUCLn6C5w8kKcTMlsp1m/7PZlg06b+I
	 mrHk4wYg6/yjkT3tupXARd623JlOKCybIRPXEUm5bRk30G0hi9Sq36ECAz3spxDpGMLN7
	 20KQb49cpvzO99KWvyLWhgqioG44+WaN5YKk44Pftr9u6QZWzKZZlBofoBFPBrz8fUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=IL6o8jTS;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4B606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B4B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=IL6o8jTS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795345361; x=1795604561;
	bh=oe6lCbVz4PXw++hMRyTfF7hSGrlUjAPfQqINuBYzmDk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IL6o8jTS1ZFOkqRdHCO2QNbIgVf01Mj6bRO/aZTruAy7+2aXEnri4/SFeN7AOB/Ru
	 kU7x3ingnZtKDabtFKkf6eNHrcNHSDZLoJyeL/qNYlWQ9ISAV4KFew56HiK93OfOer
	 LmLPRuGBivCtqpqjEUwd8RsaWw4aPEE9jqx0iK/jTnV7z+9kMcBNGSK5Myeh3rzERW
	 J/qn3g+VdYDLALgyVpMdW1YIK64/qW+0kFU+K0E/9ZhezXkCIczvoE/ybQP7+F5Pdz
	 6DMn60lx+cfuoc1YOAAcv4sE37hIqdqoy8vQ/rkQJ2fPied7n7VoXVGumrr5wnr5Ia
	 XMag67PwLr29A==
Date: Sun, 22 Nov 2026 11:02:37 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] wifi: rtw89: fix OOB read past firmware buffer when duplicating elements
Message-ID: <ytQySf18yumsCuJ_PpQ09dii9Z-w5E-HcJ02et8LQe5uxa1wIRWZc1zTjV1666LGjed06fu-J1Vv5M6TZPnt2iCSoaXamBkN0rG0S_BvO3o=@proton.me>
In-Reply-To: <ycKOLfq3sWokgWxf1yMxmqtns2Sjh90xRG46gH7U89uffkJrcs4pUZPAjONVr20rfG0FJ6kLNFTW_YT-Z02z5ZNLGo8h3RS9t1WSMJFrw4E=@proton.me>
References: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me> <ycKOLfq3sWokgWxf1yMxmqtns2Sjh90xRG46gH7U89uffkJrcs4pUZPAjONVr20rfG0FJ6kLNFTW_YT-Z02z5ZNLGo8h3RS9t1WSMJFrw4E=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: ffc2597e6bfcf46cd6306f98311612b2db6c6e53
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

rtw89_board_elm_seek() validates the selected entry against the board
element file with

=09if (unlikely(board_elm->size < ofst + size))

where ofst and size are u32 values read from the file. The addition
wraps in u32, so a crafted file with, for example,
ofst =3D 0xffffff00 and size =3D 0x200 passes the check and
pseudo_fw->data is set to board_elm->data + 0xffffff00 with
pseudo_fw->size =3D 0x200. The element walk then dereferences that
pointer and reads out of bounds.

Use remainder arithmetic against board_elm->size, which cannot wrap on
any architecture. The helper is new in v7.4-rc1, so only the current
cycle is affected.

Fixes: af5905e22a43 ("wifi: rtw89: support variants of FW elements")
Assisted-by: LLM Mistral Vibe
Signed-off-by: Falconet3 <Falconet3@proton.me>
---
v2: new. Found while fixing the element walk bounds check; split out as
    an independent caller. Compile- and sparse-tested on x86_64; no
    reproducer available.

 drivers/net/wireless/realtek/rtw89/fw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless=
/realtek/rtw89/fw.c
index 0000000..0000000 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1734,12 +1734,13 @@ static int rtw89_board_elm_seek(const struct firmwa=
re *board_elm,
 =09if (num <=3D board_id)
 =09=09return -ENOENT;
=20
 =09ent =3D &hdr->ents[board_id];
=20
 =09ofst =3D le32_to_cpu(ent->ofst);
 =09size =3D le32_to_cpu(ent->size);
=20
-=09if (unlikely(board_elm->size < ofst + size))
+=09if (unlikely(ofst > board_elm->size ||
+=09=09     size > board_elm->size - ofst))
 =09=09return -EFAULT;
=20
 =09memset(pseudo_fw, 0, sizeof(*pseudo_fw));
--=20
2.53.0
