Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458182;
	b=aZQDpqmtnA+BCvLqR3KWzM31eGpJd7xW+YhGJMoLMy6cGviwDPMzEVH+32bxGZrF/Hc8
	 KrVHdUGZmHN8j0NMO1qkHAE/OdprFip0u2MUiueGwMRP0V9AGssWslEJmKfFXlaR5gfv7
	 D1uh+q+bmG1niC4WJ57to1/Edt46uqIlPERhl/vcrzzIVMxS5eyOBdfcez+KOtgyhNhny
	 jNWHWeWaailNwaxANzPazoO/qkkZ+VmGjg9H0mzTIx2uMO6r6kgD4mDcCd+AoOc0xOx5f
	 VGY27zCrpmFNqfB5iX+BNVPK3EcntJ898tWtNeWaX/lCVYzOHSrSESN0Z5KmdC7V1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458182;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dESSg6TD5Wm4y0aJXGC52Q6BDhANdiqcspy9j5VmWFc=;
	b=B/IC1QLnUFAkG8hAZdwd9A2O73kVBE0PhWWJ13UdVtW3UUfMhjy+Tb8CeIrNguPlMKke
	 shTn0srhSuaLIj9AyULgUf/g2cfeTJlhQa1lfq/ISI6Hemqbn4AMaVrOx4CVdHvfU0Y/P
	 bOvOzXRDmQsc6wOvswokE6vTWQMH1pLMxDXQfI/+AvIR7lryHeEzoJoK4Qd+XbM/wnSuX
	 X2+WkiZFBbwyhdNkzNVNK8GdUNItG7EU/gaQ2VSXsZ7ypOzxoaDsFVEjFVSK0KRM869wi
	 z8BXJsW0M+ZmPXqWIoXt645rzfFsCDiR0BImb8iKr+8NzA0q1yfUSVaZ1NIVLXoVdeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=PuIoPRyN;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9C606A31A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=PuIoPRyN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795458179; x=1795717379;
	bh=dESSg6TD5Wm4y0aJXGC52Q6BDhANdiqcspy9j5VmWFc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PuIoPRyNhLp0UjwpzgjEVzht7ymKEHXV2+mJ2h5Ht1rf4iHi/hfB8rFmbN8hhddWS
	 zZBAjbDQj09HtVxJigTUKS5xERd3EdyhQTu1MkKv144e3SWqnT9ZGgAiBjcIqFt6Tk
	 VAw1IxJ9MwaMLH4iocnMv6SX62mB1E8Aaw1F+S/Kf5ADLogPIxmgeDVZ3O2LP5EYwG
	 SPrzb1IQC1FY7JjNP1C8KoK6V7C/N6TUjwbiMBbOPPPa6xGb5OlBbSdE5vDsfWHVmO
	 W9NqOPSJCslhuoZAXN3WJU1ic1dgi5zFUUN2XADHULRaB06s4eWCe5d/WNwHiMLHRq
	 vgLhSo2O6PRow==
Date: Mon, 23 Nov 2026 18:22:55 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: Falconet3 <Falconet3@proton.me>
Cc: "pkshih@realtek.com" <pkshih@realtek.com>
Subject: [PATCH v4 1/2] wifi: rtw89: fix element walk bounds checks
Message-ID: <B6QON2a1ZGk3ddppttcN5qus6WXB2bodBbLcQQEXK7zfi7AcYQjU2qTIjYb4nS7QE62oRYH14MK65-AZ4VafzlrFpNKhEFunww-H6B1kuV4=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: d1492cb049f2409d424ee8ce13d14f878b91b33a
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
elements (size_t len =3D sizeof(*elm) + le32_to_cpu(elm->size)), read the
header and the body. A crafted element with
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
architecture. An element whose header and non-empty body end exactly at
firmware->size is now accepted; before, such exact fits were rejected
even though they are in bounds.

Fixes: a337d4331fd6 ("wifi: rtw89: introduce infrastructure of firmware ele=
ments")
Cc: stable@vger.kernel.org
Assisted-by: LLM Mistral Vibe
Signed-off-by: Falconet3 <Falconet3@proton.me>
---
v4: resend as a new thread at the maintainer's request; no code change
    since v3.
v3: resend of the series with the correct subjects and version label; no
    code change since v2.
v2: validate the walk start offset before dereferencing hdr (fixes the
    32-bit wrap), use size_t remainder arithmetic, note the exact-fit
    acceptance, correct Fixes: and the affected range, add Cc: stable.
    Compile- and sparse-tested on x86_64; no reproducer available.

 drivers/net/wireless/realtek/rtw89/fw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless=
/realtek/rtw89/fw.c
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1671,11 +1671,12 @@
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
--=20
2.53.0
