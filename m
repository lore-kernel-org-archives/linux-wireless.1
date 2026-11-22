Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345223;
	b=BxAhwel72dMon9HUd+wraBpeSMIdAJ6pZtEjJVfEDcwyVZQcGlZi3rOecg8aIudbK53F
	 /3KeErUIm5la58uVxmCpSTvlhB//Non2zRppYuvqBcwkGj0Okq5fWQ1ptTQdJB329viEz
	 U1PfXKsO9sXi1dTkwLDLplwp3RpM/tu0xB+67rBmeF5GC63nO+JGYYSmsYJITQ9BnSUIf
	 RFOPmYHhz7mEftsjbT3d3B8WmUo7ljE8WFRdYAzWX7iFbkYdxnWFUzkdgHvLBDFIb8HXy
	 Coe7u+BWc8pARPhTNXnE0wDdMUWgb8kO3yMzDB8UY/Ow/u7TLcy5indQr+Dq95iQRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345223;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OEQj/h6TR8OikHam/xppwe4USyzjAi95iXiUPY1O/JU=;
	b=VyBwN12lFEk+OlX2qXTJnREOF3LzOj5HbTcXLu+XMZT88oS0O9h4ZLbVd9gETEPcL+qY
	 C7s1hMKqP4l0D/JCbaOi4LhOof8qL8KrO6Pl70/+Nz0PR6OM+YEJHAUkdRCyJMeEvxAoQ
	 DM+BicKxgFDLIqXM82Ifww0zXCciKGesly48+0st+Rb7FDFiBmY53hwcl0PEjYBD8qPCB
	 5mAYmWpByUq7NgR9ptzHrl/pN4LptwqDPNm87OL2SwF0S7CyiJcM0Deky1dmROOZwvJrx
	 VZOU4c9OpgWPgLLoQ4VnPSSVKYFSpuZVZCZLjJMPqi5jLRwq7PEL+RK7nxYfjc2mE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WVZAVvDJ;
	arc=none smtp.remote-ip=79.135.106.99
Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E448606A334
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 11:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E448606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WVZAVvDJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795345220; x=1795604420;
	bh=OEQj/h6TR8OikHam/xppwe4USyzjAi95iXiUPY1O/JU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WVZAVvDJveQ8FnhKO9QNPFzS8Gn2z/wlJ5hU/ZwP5BGUzzpaphQKHHiAnDwr7ywC8
	 Wdnx1k69BJ0wWiUPHg2fm57zelrnxooNjQQcK79apJ1l5eHNW8yz7NGPlaRXDUDNbf
	 QDnL/ajdD4qxSeL8yVzSZO1u6ruj9DQRLs7KmQb1MSLojqUYxPHFkXLKhIKXFwXyOh
	 YDn5WRpJxVpaxyikNY3DQHqySQyKYS9l/8qfMjtjmZrQsx5IkgfVeGHVD/Fntd04QQ
	 Bjow4zX9D69lc2hjzm7xk6O0zcFnJh/uS6o6hwgxYdeC8P5pu5VKvu4nWtEQHO+OKX
	 BREWnZ901j8ow==
Date: Sun, 22 Nov 2026 11:00:16 +0000
To: "pkshih@realtek.com" <pkshih@realtek.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] wifi: rtw89: fix OOB read past firmware buffer when duplicating elements
Message-ID: <ycKOLfq3sWokgWxf1yMxmqtns2Sjh90xRG46gH7U89uffkJrcs4pUZPAjONVr20rfG0FJ6kLNFTW_YT-Z02z5ZNLGo8h3RS9t1WSMJFrw4E=@proton.me>
In-Reply-To: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me>
References: <ONBhkh_B7hyKoHNRpjYgxy7da68QOa8cWUqztT-I1nW-KukOKE30FIYFLkX1Tm_TrXlBjse5d-AFRwsyzfxBdMGKvyIEoVsjyZQqxzUkRQk=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: f5057802730493c971ed7f36e5aa9484c3a78ff7
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

__rtw89_fw_recognize_elements() checks only the element body against
firmware->size, omitting the 32-byte struct rtw89_fw_element_hdr:

=09while (offset + sizeof(*hdr) < firmware->size) {
=09=09...
=09=09elm_size =3D le32_to_cpu(hdr->size);
=09=09if (offset + elm_size >=3D firmware->size)

The element handlers, and rtw89_fw_elem_dup_if_needed() when it copies
elements, read both header and body. A crafted element with
offset + elm_size =3D=3D firmware->size - 1 passes the check and is read up
to sizeof(struct rtw89_fw_element_hdr) - 1 =3D 31 bytes past
firmware->data. For firmware larger than 2 MB the copy path also stores
those bytes in a persistent devm_ buffer.

The walk start offset is not validated either: rtw89_mfw_get_size()
returns le32_to_cpu(mfw_info->shift) + le32_to_cpu(mfw_info->size), and
rtw89_mfw_validate_hdr() only checks that the info array fits in the
buffer. On 32-bit (sizeof(size_t) =3D=3D 4) an aligned offset >=3D 0xffffff=
e0
wraps "offset + sizeof(*hdr)" in the loop guard, so hdr->size is
dereferenced out of bounds before any check runs.

Check the start offset before dereferencing hdr and use size_t remainder
arithmetic for both bounds checks, which cannot wrap on any
architecture. An element whose header and body end exactly at
firmware->size is then accepted; it is fully in bounds, while such exact
fits were rejected before.

Fixes: a337d4331fd6 ("wifi: rtw89: introduce infrastructure of firmware ele=
ments")
Cc: stable@vger.kernel.org
Assisted-by: LLM Mistral Vibe
Signed-off-by: Falconet3 <Falconet3@proton.me>
---
v2: validate the walk start offset before dereferencing hdr (fixes the
    32-bit wrap), use size_t remainder arithmetic, note the exact-fit
    acceptance, correct Fixes: and the affected range, add Cc: stable.
    Compile- and sparse-tested on x86_64; no reproducer available.

 drivers/net/wireless/realtek/rtw89/fw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless=
/realtek/rtw89/fw.c
index 0000000..0000000 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1668,16 +1668,17 @@ static int __rtw89_fw_recognize_elements(struct rtw=
89_dev *rtwdev,
 =09const struct rtw89_fw_element_handler *handler;
 =09const struct rtw89_fw_element_hdr *hdr;
 =09u32 elm_size;
 =09u32 elem_id;
 =09int ret;
=20
-=09while (offset + sizeof(*hdr) < firmware->size) {
+=09while (offset < firmware->size &&
+=09       firmware->size - offset > sizeof(*hdr)) {
 =09=09hdr =3D (const struct rtw89_fw_element_hdr *)(firmware->data + offse=
t);
=20
 =09=09elm_size =3D le32_to_cpu(hdr->size);
-=09=09if (offset + elm_size >=3D firmware->size) {
+=09=09if (elm_size > firmware->size - offset - sizeof(*hdr)) {
 =09=09=09rtw89_warn(rtwdev, "firmware element size exceeds\n");
 =09=09=09break;
 =09=09}
=20
 =09=09elem_id =3D le32_to_cpu(hdr->id);
--=20
2.53.0
